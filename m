From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 11:58:54 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <CAJtjsKYkA53_yxOmB4jxy1Kc=iWEWrKYyz2GLKTKhSs7UMGCZw@mail.gmail.com>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <CAJtjsKYkA53_yxOmB4jxy1Kc=iWEWrKYyz2GLKTKhSs7UMGCZw@mail.gmail.com>
Message-ID: <20180226115854.0f07b0d5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 11:51:41 +0100, Johan Oudinet wrote:

> > I propose that we make erlang depend on x86/x86_64 as host
> > architecture. Johan, Frank, are you OK ?  
> 
> Yes, I agree with making host-erlang depends on x86/x86_64
> architectures. I never compile it from another architecture anyway. I
> looked at existing patches to such errors, but find nothing that make
> Erlang successfully compiled from a powerpc or an arm host.
> What is the exact option to add to Config.in to achieve this?
> Do you want me to submit a patch or you do it?

Since there is nothing that selects BR2_PACKAGE_ERLANG, it's pretty
easy as there only one place to modify.

I think I would keep it simple and in package/erlang/Config.in, do:

config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
	bool
	default y if BR2_HOSTARCH = "x86_64"
	default y if BR2_HOSTARCH = "x86"

config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
	bool
	... keep existing code ...
	# erlang needs host-erlang
	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS

And be done with it :)

If you could submit a patch doing this, it'd be nice. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
