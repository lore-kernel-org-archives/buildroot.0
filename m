From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Mar 2014 23:32:12 +0100
Subject: [Buildroot] [PATCH 0/13 v2] some download-related changes
In-Reply-To: <e621c002-e271-4fb7-ac3a-86ebfa4e460b@email.android.com>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <CAHXCMMJj3GskwyhNsXtZNcT_oRAVOZECQ6e9-8xCEG4uOE_g0A@mail.gmail.com>
 <e621c002-e271-4fb7-ac3a-86ebfa4e460b@email.android.com>
Message-ID: <20140302223212.GC3379@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-02 21:55 +0100, Thomas De Schampheleire spake thusly:
> Samuel Martin <s.martin49@gmail.com> schreef:
> >Yann, all
> >
> >On Sun, Mar 2, 2014 at 6:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> This series contains those download-related changes:
[--SNIP--]
> In this same area (but can be in separate patches) we should protect
> all download helpers against interrupted downloads. This is already
> some for wget and git, but not for hg and the others...

For all download helpers (except wget), we force-remove the local copy
(clone or checkout) before cloning/checking out, in case there were some
leftovers from a previous run.

The only phase that can still be interrupted is creating the archive
from the local copy. Even for git, this is not correctly handled:

    cvs:    tar czf "${output}" "${repodir}"
    git:    gzip -c "${output}.tmp" >"${output}"
    hg:     ${HG} archive [...] "${output}"
    svn:    tar czf "${output}" "${repodir}"

which leaves open a (small) window were we could have a problem.

Only wget gets it right:
    mv "${tmpfile}" "${output}"

So, yes, we can do better. I'll fix and resubmit.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
