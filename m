From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 08 Oct 2015 00:44:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Add node.js v4.1.2
In-Reply-To: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
References: <1444136239-22044-1-git-send-email-jaap@jcz.nl>
Message-ID: <1444257869.12599.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On Di, 2015-10-06 at 14:57 +0200, Jaap Crezee wrote:
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>
> ---
>  ...01-Remove-dependency-on-Python-bz2-module.patch | 31
> ++++++++++++++++++++++
>  package/nodejs/Config.in                           |  5 ++++
>  package/nodejs/nodejs.hash                         |  3 +++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/nodejs/4.1.2/0001-Remove-dependency-on
> -Python-bz2-module.patch
> 
> diff --git a/package/nodejs/4.1.2/0001-Remove-dependency-on-Python
> -bz2-module.patch b/package/nodejs/4.1.2/0001-Remove-dependency-on
> -Python-bz2-module.patch
> new file mode 100644
> index 0000000..de83d44
> --- /dev/null
> +++ b/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2
> -module.patch
> @@ -0,0 +1,31 @@
> +From 3d4817c152d6f3afddcc699949c4d1664da91e2b Mon Sep 17 00:00:00
> 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Tue, 30 Jun 2015 09:43:11 +0100
> +Subject: [PATCH 1/4] Remove dependency on Python bz2 module
> +
> +The Python bz2 module is only needed in certain cases, so only
> import
> +it when needed. In the normal nodejs build, this allows to remove
> the
> +dependency on this module.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com
> >
> +[Martin: adapt to 0.12.5]
> +Signed-off-by: Martin Bark <martin@barkynet.com>
> +---
> + deps/v8/tools/js2c.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
> +index 77485f6..371caf5 100755
> +--- a/deps/v8/tools/js2c.py
> ++++ b/deps/v8/tools/js2c.py
> +@@ -34,7 +34,6 @@
> + import os, re, sys, string
> + import optparse
> + import jsmin
> +-import bz2
> + import textwrap
> + 
> + 
> +-- 
> +2.1.4
> +
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 329d270..b25375b 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -40,12 +40,17 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
>  	bool "v0.12.7"
>  	depends on !BR2_ARM_CPU_ARMV5
>  
> +config BR2_BR2_PACKAGE_NODEJS_4_1_X
> +	bool "v4.1.2"
> +	depends on !BR2_ARM_CPU_ARMV5
> +
>  endchoice
>  
>  config BR2_PACKAGE_NODEJS_VERSION_STRING
>  	string
>  	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
>  	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
> +	default "4.1.2"     if BR2_BR2_PACKAGE_NODEJS_4_1_X
>  
>  menu "Module Selection"
>  
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 9be2806..9f75471 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -3,3 +3,6 @@ sha256	bae79c2fd959aebe1629af36077bebbb760128d
> b753da226d2344cd91499149f  node-v0
>  
>  # From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
>  sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415
> be7e12f39d  node-v0.12.7.tar.gz
> +
> +# From upstream URL: http://nodejs.org/dist/v4.1.2/SHASUMS256.txt
> +sha256	febec3703a3fea9b64c46100a7b6a4408250027aa8259a2a815fd2
> 275d502c49  node-v4.1.2.tar.gz

No need for patch #2 and #3 from 0.12.x?

Additionally, this package does not compile with the Sourcery CodeBench
x86/x86_64 2012.09 toolchain:

    In file included from ../src/js_stream.h:6:0,
                     from ../src/js_stream.cc:1:
    ../src/stream_base.h:218:11: error: looser throw specifier for
    'virtual node::StreamBase::~StreamBase()'
    ../src/stream_base.h:134:11: error:   overriding 'virtual
    node::StreamResource::~StreamResource() noexcept (true)'
    In file included from ../src/js_stream.cc:1:0:
    ../src/js_stream.h:17:3: error: looser throw specifier for 'virtual
    node::JSStream::~JSStream()'
    In file included from ../src/js_stream.h:6:0,
                     from ../src/js_stream.cc:1:
    ../src/stream_base.h:218:11: error:   overriding 'virtual
    node::StreamBase::~StreamBase() noexcept (true)'
    node.target.mk:146: recipe for target
    '/home/joerg/Development/git/buildroot/output/build/nodejs
    -4.1.2/out/Release/obj.target/node/src/js_stream.o' failed
    make[2]: ***
    [/home/joerg/Development/git/buildroot/output/build/nodejs
    -4.1.2/out/Release/obj.target/node/src/js_stream.o] Error 1
    make[2]: *** Waiting for unfinished jobs....
    make[2]: Leaving directory
    '/home/joerg/Development/git/buildroot/output/build/nodejs
    -4.1.2/out'
    Makefile:45: recipe for target 'node' failed
    make[1]: *** [node] Error 2
    make[1]: Leaving directory
    '/home/joerg/Development/git/buildroot/output/build/nodejs-4.1.2'
    package/pkg-generic.mk:156: recipe for target
    '/home/joerg/Development/git/buildroot/output/build/nodejs
    -4.1.2/.stamp_built' failed
    make: *** [/home/joerg/Development/git/buildroot/output/build/nodejs
    -4.1.2/.stamp_built] Error 2

Maybe gcc > 4.7 required?

Best regards
J?rg Krause
