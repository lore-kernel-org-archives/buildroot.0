From: Christian Stewart <christian@paral.in>
Date: Fri, 29 Dec 2017 11:54:52 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <20171228180402.GR27558@waldemar-brodkorb.de>
References: <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de> <87po73d1xz.fsf@paral.in>
 <20171225151337.GC27558@waldemar-brodkorb.de> <87mv25cg5t.fsf@paral.in>
 <87shbxq99x.fsf@paral.in> <20171227030548.GE27558@waldemar-brodkorb.de>
 <87y3loenlr.fsf@paral.in> <20171227080520.GF27558@waldemar-brodkorb.de>
 <87o9mkdlf1.fsf@paral.in> <20171228180402.GR27558@waldemar-brodkorb.de>
Message-ID: <874lo9xqb7.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Waldemar,

Waldemar Brodkorb <wbx@openadk.org> writes:
>> Thank you again for taking the time to debug this, I've had this issue
>> early 2017 and have avoided upgrading Buildroot until we find a fix.
>
> Sorry I believe you entered the world of libtool hell.
>
> For the hardcore buildroot hackers, if you create a symlink in /lib
> pointing to libpam.so / libpam_misc.so you can reproduce the issue.

So there is a bug in libtool / Buildroot after all, when dealing with
/lib/libpam.so. I was previously able to bisect it down to a commit
upgrading the default Linux headers version, but I can't imagine this is
related.

> By the way, I couldn't reproduce the issue with OpenADK.
> Unfortunately I can't point to a specific patch. 
> I always pass -Wl,-rpath-link -Wl,$(STAGING_DIR)/usr/lib in
> LDFLAGS and I always remove any .la files from staging directory.

My libtool knowledge is lacking... Is there a work-around I can apply to
force Buildroot to use these LDFLAGS? I could edit the autotools infra I
suppose, but this seems like a real hack.

> I do not patch the package provided ltmain.sh/libtool stuff like
> Buildroot, but I always use libtool 2.4.6 with a small patch 
> like this when autoreconfing a package:
> +++ libtool-2.4.6/m4/libtool.m4
> -  _LT_TAGVAR(hardcode_automatic, $1)=no
> +  _LT_TAGVAR(hardcode_automatic, $1)=yes

If I try to change this in libtool in Buildroot:

checking whether the C compiler works... no
configure: error: in `/home/buildroot/skiff/workspaces/pi3/build/host-libtool-2.4.6':
configure: error: C compiler cannot create executables

I'm guessing I did it wrong? :)

> So sorry, I can't help you out of the hell.

Thanks for your help!

Best,
Christian
