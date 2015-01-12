From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Jan 2015 17:05:06 -0300
Subject: [Buildroot] [PATCH] squid: fix automake breakage
In-Reply-To: <20150112205811.6cb75c60@free-electrons.com>
References: <1420679367-24134-1-git-send-email-gustavo@zacarias.com.ar>
 <20150112205811.6cb75c60@free-electrons.com>
Message-ID: <54B428F2.9010102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2015 04:58 PM, Thomas Petazzoni wrote:

> Even though I am not too happy about the fix, I applied it in order to
> fix the autobuilder issues.
> 
> I'd like to understand better why the libltdl bundled in Squid thinks
> it should autoreconf itself.

I couldn't find the why yet, but i did find that the fact that we don't
autoreconf libtool causes it since libtool 2.4.4 is packaged with
automake 1.14.1.
In a project where host-libtool (i.e. autoreconfs) see:

output/target/usr/share/libtool/aclocal.m4 ->
[AM_AUTOMAKE_VERSION([1.14.1])dnl
(circa line 54)

Since libtoolize blindly copies this at some point libltdl
automatically-triggered autoreconf uses this version (actually
am__api_version='1.14' in line 35) to call it, hence breaking.

One solution would be to autoreconf libtool which doesn't seem
straightforward.
Another is to "hack" libtool and s/1.14.1/1.15/ + s/1.14/1.15/ that file
(tested to work).
We could also define ACLOCAL & co in the autotools infra, it shouldn't
hurt any package, though i haven't tested this.

In any case it seems to be a problem limited to squid only or we would
have seen more of these.

Regards.
