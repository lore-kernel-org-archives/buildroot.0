From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Oct 2013 11:39:24 -0300
Subject: [Buildroot] [PATCHv2 0/5] Add apache thrift
In-Reply-To: <OFFDA9CD4F.D79FA1A1-ON86257C14.0003E215-86257C14.0004BF76@rockwellcollins.com>
References: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
 <OFFDA9CD4F.D79FA1A1-ON86257C14.0003E215-86257C14.0004BF76@rockwellcollins.com>
Message-ID: <52711A1C.3090006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/2013 09:51 PM, rjbarnet at rockwellcollins.com wrote:

> So how do you envision a new person to add a package that utilizes
> thrift as their complier? I guess what I'm trying to get at here is I
> just want to try to understand how the thrift package will be used. I'm
> pretty sure how you are going to do it but without an example in this
> patchset I can't be sure.
> 
> Here is how I'm envisioning it with the packages you have submitted.
> 
> Config.in
> ----------
> has "select BR2_PACKAGE_THRIFT"
> 
> 
> foo.mk
> --------
> FOO_DEPENDENCIES = host-thrift

FOO_DEPENDENCIES = thrift
You'll need the runtime libs which implement all the networking stack
besides the host tool to compile.
A thrift definition file assembles into target source code with the tool
with the chosen language. This could ostensibly be done outside
buildroot, but very few distributions ship the thrift tool.
Coarsely speaking it would fit in a build process like bison or flex.

> define FOO_BUILD_CMDS
>         # This assumes that the package's Makefile uses THRIFT for the
> compiler
>         $(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C
> $(@D)
> endif

Not really, for a package/project with a proper Makefile you'd just
point THRIFT=$(HOST_DIR)/usr/bin/thrift to it and be handled internally
as part of the overall build process.

> Granted there is more each of the packages but this covers the thrift
> specific parts. Please correct me if I have made incorrect assumptions
> with how you envisioned utilizing THRIFT.

We can always define $(THRIFT) to make it handy for developers like it's
done for QT_QMAKE for example - but being generally used with specific
parameters (target language mostly) it would just point to the binary
since it's pretty much self-contained.
Regards.
