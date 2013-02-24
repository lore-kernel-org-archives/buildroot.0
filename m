From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Feb 2013 16:38:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-23
In-Reply-To: <20130224073422.A0E2C43043B@lolut.humanoidz.org>
References: <20130224073422.A0E2C43043B@lolut.humanoidz.org>
Message-ID: <201302241638.19487.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sunday 24 February 2013 Thomas Petazzoni wrote:
> Build 7eae46b1a84fb5bde78e4f9b8d42c66eb843ecbb
> ==============================================
> 
> Status         : NOK
> Failure reason : tvheadend-v3.3
> Architecture   : mips64el
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-02-23 05:31:20
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=0b9e763e161ceb0b4d81a344d10c1a33c1036af7
> End of log     : http://autobuild.buildroot.net/results/7eae46b1a84fb5bde78e4f9b8d42c66eb843ecbb/build-end.log

I'm not sure how to solve that one:

CC		build.linux/src/v4l.o
/home/test/test/output1/build/tvheadend-v3.3/src/v4l.c: In function
'v4l_adapter_check':
/home/test/test/output1/build/tvheadend-v3.3/src/v4l.c:465:5: error: format
'%llx' expects argument of type 'long long unsigned int', but argument 6 has
type 'v4l2_std_id' [-Werror=format]

(twice the same error).

But:
  - "long long unsigned int" is 64-bit wide, unsigned
  - "v4l2_std_id" is a "__u64", so is 64-bit wide, unsigned
  - it's only used for logging to stderr

I'm not very happy with disabling -Werror, so I was thinking about casting
the value to hush gcc.

Strangely enough, all these %llx errors only occur on mips64el:
  2013-01-17 - http://autobuild.buildroot.net/results/9a01b9244be38395db144207622a860a6aaf40fe/
  2013-01-16 - http://autobuild.buildroot.net/results/a55b61b733c9a8a95f7f930d8d4395accf2e50f9/

What's so special about mips64el that it does not like v4l2_std_id as an
unsigned 64-bit value (I've checked the headers, it is an __u64).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
