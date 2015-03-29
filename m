From: =?UTF-8?B?U8OpYmFzdGllbiBSb3llbg==?= <sebastien.royen@armadeus.com>
Date: Sun, 29 Mar 2015 21:08:16 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <20150329144607.0e60928f@free-electrons.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com>
Message-ID: <55184DA0.1050901@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry,

I should not submit patch of patch too late in the evening.
I hope the version below is better.
Not tested with python3, and not sure toolchain output language shouln't
be fix in another way to avoid same problem on other packages.

Le 29/03/2015 14:46, Thomas Petazzoni a ?crit :
> Dear S?bastien Royen,
>
> On Sat, 28 Mar 2015 00:07:24 +0100, S?bastien Royen wrote:
>> setup.py: do not add crosscompile header locations if language is not
>> english
>>
>> With buildroot toolchain, gcc can be multi language.
>> Python package setup.py need gcc english output to work fine. (find zlib
>> for example)
>> We force language to en_US for the need of output parsing.
>>
>> Signed-off-by: Sebastien Royen <sebastien.royen@armadeus.com>
> What you posted is not a Buildroot patch, so we cannot apply it. I
> guess it's a python or python3 patch. Can you rework this to make it
> actually usable by Buildroot, and also make sure whether the issue is
> applicable to python, python3, or both?
>
> Thanks,
>
> Thomas
--- a/package/python/116-enforce-cross-compile-headers-search.patch  
 1970-01-01 01:00:00.000000000 +0100
+++ b/package/python/116-enforce-cross-compile-headers-search.patch  
 2015-03-27 23:58:21.478991279 +0100
@@ -0,0 +1,20 @@
+setup.py: do not add crosscompile header locations if language is not
english
+
+With buildroot toolchain, gcc is multi language.
+setup.py need english output to work fine. (find zlib for example)
+We force language to en_US for the need of output parsing.
+
+Signed-off-by: Sebastien Royen <sebastien.royen@armadeus.com>
+Index: b/setup.py
+===================================================================
+--- a/setup.py    2015-03-27 23:55:53.738987211 +0100
++++ b/setup.py    2015-03-27 23:44:48.482968892 +0100
+@@ -414,7 +414,7 @@
+         tmpfile = os.path.join(self.build_temp, 'gccpaths')
+         if not os.path.exists(self.build_temp):
+             os.makedirs(self.build_temp)
+-        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' %
(gcc, tmpfile))
++        ret = os.system('LANGUAGE=en_US %s -E -v - </dev/null 2>%s
1>/dev/null' % (gcc, tmpfile))
+         is_gcc = False
+         in_incdirs = False
+         inc_dirs = []
