From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2020 09:17:55 +0100
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download
 features concept
In-Reply-To: <b782018a-bec1-07d5-da24-128d4eba2a1b@mind.be>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
 <CAMQcK5+-_N_Rwkx6E+w7eid5rKNVNjith7Feg8yYgzQX+dvtQQ@mail.gmail.com>
 <674b2ca7-cb45-c89d-a5e5-cfc230200db2@xes-inc.com>
 <b782018a-bec1-07d5-da24-128d4eba2a1b@mind.be>
Message-ID: <20200117091755.69711c60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jan 2020 23:59:00 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  It's good to fire it off early (as an RFC) to avoid wasting work if it's going
> in the wrong direction.
> 
>  ... which I think this is.
> 
>  I guess the idea is to generalize the submodules feature so it can be used by
> several VCS systems, and to combine it with the transient option.
> 
>  However, I don't think the additional complexity is worth it.
> 
>  Separate _GIT_SUBMODULES = YES and _DOWNLOAD_TRANSIENT = YES are IMO easier to
> understand than _DL_FEATURES = submodules transient, because we don't really
> have the latter pattern anywhere else in Buildroot. In addition, it's hard to
> remember if it's comma-separated or space-separated.

I asked the exact same question on IRC before Vincent sent his patch
series, and both Yann and me suggested that it should be sent with
actual examples of how the DL_FEATURES mechanism will be used.

The intention of Vincent is not to use this DL_FEATURES variable for
"transient", but rather to implement download method specific things,
and the first example was git-lfs support.

transient would remain a separate variable. transient is independent of
the download method: it only tells the download infrastructure to
ignore the cache, and always redownlaod from upstream, regardless of
the download method.

DL_FEATURES however would be to pass backend-specific flags.

That being said, I agree that with just two flags for the moment
(submodules and git-lfs), it's not clear this is really needed. Also,
this DL_FEATURES mechanism only allows to pass booleans, which works
fine for submodules and git-lfs, but what if we want to pass some
actual value to a download backend (like a timeout value, or some other
thing).

So maybe with just two booleans for now, we should stick to
<pkg>_GIT_SUBMODULES = YES and <pkg>_GIT_LFS = YES ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
