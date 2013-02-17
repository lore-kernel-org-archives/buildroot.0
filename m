From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Feb 2013 21:44:09 +0100
Subject: [Buildroot] [PATCH] xlib_libpthread-stubs: needs -pthread when
 linking statically
In-Reply-To: <20130217183823.4f196ea9@skate>
References: <1361109023-21403-1-git-send-email-arnout@mind.be>
 <20130217183823.4f196ea9@skate>
Message-ID: <51214119.6020806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/13 18:38, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
>
> On Sun, 17 Feb 2013 14:50:22 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>>
>> Fixes http://autobuild.buildroot.net/results/392512cb348123d76962df02e38675a80eae41b1
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> My gcc manual only documents the -pthread option for some architectures,
>> but it seems to work for x86, sh and arm as well.
>
> Thanks. However, I'd like to see if an upstream fix would not be more
> appropriate for this. If you look at the build log, it shows:
>
> checking for pthread_self... no
> checking for pthread_mutex_init... no
> checking for pthread_mutex_destroy... no
> checking for pthread_mutex_lock... no
> checking for pthread_mutex_unlock... no
> checking for pthread_cond_init... no
> checking for pthread_cond_destroy... no
> checking for pthread_condattr_init... no
> checking for pthread_condattr_destroy... no
> checking for pthread_cond_wait... no
> checking for pthread_cond_timedwait... no
> checking for pthread_cond_signal... no
> checking for pthread_cond_broadcast... no
> checking for pthread_equal... no
> checking for pthread_exit... no
>
> It is really those tests that are wrong I'd say. They should have
> detected that the C library provides the pthread functions.
>
> The AC_CHECK_FUNCS test in configure.ac checks those functions, but
> does not specify that those functions should be tested by linking
> against -lpthread. Wouldn't an upstreamable configure.ac patch be more
> appropriate here?

  Linking against -lpthread isn't enough, apparently.

  Many packages use the ACX_PTHREAD macro [1]. That is probably a 
possibility.

  Regards,
  Arnout

[1] http://ac-archive.sourceforge.net/ac-archive/acx_pthread.html

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
