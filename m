From: Michael Nebel <michael@nebel.de>
Date: Fri, 10 May 2019 19:27:21 +0200
Subject: [Buildroot] problems compiling nodejs 10.15.3 and suggested fix
Message-ID: <a8114d08-6afa-95eb-0152-ce47cc923921@nebel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I started to evaluate buildroot some days ago. The "make menuconfig" was
very intriguing for me. It felt like coming home again :-) Cool and
thanks for this project!

After first successful experiments with buildroot-2019.02.2, I switched
to the git-version. Here I ran into some troubles to compile nodejs for
x86_64. It failed with

  output/build/host-nodejs-10.15.3/out/Release/torque:
        error while loading shared libraries: libcrypto.so.1.1:

After some poking around, I applied the following patch to nodejs.mk and
built everything successfully:

nebel at tyche ~/src/buildroot $ git diff
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2577239e19..abf51a3f9c 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -72,6 +72,7 @@ define HOST_NODEJS_BUILD_CMDS
        $(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
                $(MAKE) -C $(@D) \
                $(HOST_CONFIGURE_OPTS) \
+               LD_LIBRARY_PATH="$(LD_LIBRARY_PATH):$(HOST_DIR)/lib/" \
                NO_LOAD=cctest.target.mk \
                PATH=$(@D)/bin:$(BR_PATH)


I don't oversee the whole complexity of buildroot. So I don't know, if
this patch is a valid solution. Is there a better way? Is it worth the
effort to generate and submit a regular patch?

Greetings from northern Germany

	Michael
-- 
Michael Nebel
								
