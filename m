From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jul 2014 12:07:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-11
In-Reply-To: <20140712095548.GA3582@free.fr>
References: <20140712063006.DDD28100E08@stock.ovh.net>
 <20140712095548.GA3582@free.fr>
Message-ID: <20140712100741.GB3582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-12 11:55 +0200, Yann E. MORIN spake thusly:
> On 2014-07-12 08:30 +0200, Thomas Petazzoni spake thusly:
> >        arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/10f268cd55f16ee53f4c5e17e1248b0a1820f6ea/
> 
> Reproduced, investigating...

OK, the sqlite3 extension has a bug. It has code like:

    ---8<---
    void _pysqlite_final_callback(sqlite3_context* context)
    {
        PyObject* function_result;
        PyObject** aggregate_instance;
        int ok;

    #ifdef WITH_THREAD
        PyGILState_STATE threadstate;

        threadstate = PyGILState_Ensure();
    #endif

        aggregate_instance = (PyObject**)sqlite3_aggregate_context(context, sizeof(PyObject*));
        if (!*aggregate_instance) {
            goto error;
        }

        [......]

    error:
    #ifdef WITH_THREAD
        PyGILState_Release(threadstate);
    #endif
    }
    ---8<---

So, they are doing right to cleanup in case of error. But when threads
are not available, the function is like:

    ---8<---
    void _pysqlite_final_callback(sqlite3_context* context)
    {
        PyObject* function_result;
        PyObject** aggregate_instance;
        int ok;

        aggregate_instance = (PyObject**)sqlite3_aggregate_context(context, sizeof(PyObject*));
        if (!*aggregate_instance) {
            goto error;
        }

        [......]

    error:
    }
    ---8<---

And indeed, there's nothing after the 'error' label. And gcc does not
like that:
    connection.c:785:1: error: label@end of compound statement

So, the solution is relatively easy: add a dummy statement after the
label:

    error:
        ;
    }

And it works, now. I'll submit a patch soonish...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
