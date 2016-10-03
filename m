From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 03 Oct 2016 10:40:01 +0200
Subject: [Buildroot] [PATCH v3 1/2] spidermonkey185: New package.
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <14i9cdxqle.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Wed, 06 Jul 2016 12:24:08 +0200 schrieb Nicolas Cavallari:

> diff --git a/package/Config.in b/package/Config.in index
> 15271a2..fdc3194 100644 --- a/package/Config.in +++ b/package/Config.in
> @@ -1306,6 +1306,7 @@ endif
>  	source "package/qhull/Config.in"
>  	source "package/qlibc/Config.in"
>  	source "package/sphinxbase/Config.in"
> +	source "package/spidermonkey185/Config.in"
>  	source "package/startup-notification/Config.in"
>  	source "package/tz/Config.in"
>  	source "package/tzdata/Config.in"

after the addition of shapelib

https://git.buildroot.net/buildroot/commit/package/Config.in?
id=2655d676f0151f6cfd36c42435cf84926c209e24

your patch does not apply anymore.

The package fails to compile using this toolchain:
http://autobuild.buildroot.net/toolchains/configs/br-x86-64-core2-
full.config

jsapi.cpp:361:63: error: cannot convert ?__va_list_tag**? to 
?__va_list_tag (*)[1]? for argument ?5? to ?JSBool TryArgumentFormatter
(JSContext*, const char**, JSBool, jsval**, __va_list_tag (*)[1])?
                                       JS_ADDRESSOF_VA_LIST(ap))) {

To solve the problem add

printf("#define HAVE_VA_LIST_AS_ARRAY \n");

in js/src/jscpucfg.cpp after line 76 according to
https://groups.google.com/forum/#!topic/jsdb/CnWRh11hRHQ

Regards, Bernd
