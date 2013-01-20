From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 15:10:31 +0100
Subject: [Buildroot] [PATCH 1/6] pkg-infra: log current message
In-Reply-To: <50FBF5EA.5010303@mind.be>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <7d5b13e61ca5941293be6d1402c87ca990510e1b.1358379198.git.yann.morin.1998@free.fr>
 <50FBF5EA.5010303@mind.be>
Message-ID: <201301201510.31749.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 20 January 2013 Arnout Vandecappelle wrote:
> On 01/17/13 00:41, Yann E. MORIN wrote:
> > In order to help the auto-builders (our own, or in-house ones),
> > just log the current message in a file that contains:
> >      Package: $($(PKG)_NAME)
> >      Version: $($(PKG)_VERSION)
> >      Action : Last '>>>' message displayed
[--SNIP--]
>   I'm a bit concerned because this is another blocker for top-level 
> parallel build (the contents of last-action will be incorrect).

Do we really want to go for top-level parallel builds?
This has been discussed at length many times, and the drawbacks far
outweight any potential advantages.

> > Also, all messages are logged to a file, one per line, with the
> > date each message was generated at, as the number of seconds
> > elapsed since Epoch.
> 
>   I think this one should be sufficient for the autobuilder. It's exactly 
> what is displayed now.

*IF* we were to implement top-level // build, then that log file would
not be of any use either, as the last one to fail would not necessarily
be the last entry:

  - one job starts configuring package foo  --> logged
  - a second jobs starts building package bar --> logged
  - foo configuration fails

In this case, the last log is not the failed action.

If we do really want top-level // build, then instrumenting the build in
the MESSAGE function is not adequate.

But I think top-level // builds should be avoided...

> You could make it more structured and easily 
> parseable with an extra colon:
> echo "$$(date '+%s'): $($(PKG)_NAME) $($(PKG)_VERSION): $(1)"

An extra colon will not make it easier to parse. With the current
format, it's already easy to extract each fields:

sed -r -e 's/^([[:digit:]]+) ([^[:space:]]*) ([^[:space:]]*) (.+)$/date: \1\npackage: \2\nversion: \3\nmesage: \4\n/;'

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
