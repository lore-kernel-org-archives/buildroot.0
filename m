From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 15:02:45 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <20151104144806.6a35229f@free-electrons.com>
References: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
 <1446452252-10647-2-git-send-email-repk@triplefau.lt>
 <20151104144806.6a35229f@free-electrons.com>
Message-ID: <20151104150245.1d707768@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Remi,

On Wed, 4 Nov 2015 14:48:06 +0100, Thomas Petazzoni wrote:

> What is this fixing exactly? I've tried building Git statically, then
> Git+OpenSSL statically, then Git+OpenSSL+libcurl statically, and all
> these configurations. Can you rework your patch to clearly indicate in
> the commit log which configuration is currently failing and how it is
> failing (relevant error messages) ?

Ok, now that I looked to your patch 3/3, I understand a bit more the
problem. In my testing, it in fact doesn't detect curl anymore, because
it can't link against libcurl due to missing libraries.

Your patch 3/3 adds support for specifying a curl-config program, which
is good. But the entire purpose of using curl-config is to get the
appropriate compiler and linker flags, and in our case, curl-config is
properly saying that we should link against -lssl -lcrypto:

$ ./output/staging/usr/bin/curl-config --libs
-L/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lcurl -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz

So we definitely shouldn't have to do the hacks that you do in PATCH
1/3. Except that you have to do it because Git configure.ac is not
doing the right thing.

Since you've already contributed several fixes for this to the Git
people, can you work with upstream to resolve the problem ? Either by
calling the curl-config program from configure.ac, or by using
pkg-config (but Git developers may not like having to use pkg-config).

Also, your patch organization is weird: your patch 2/3 is adding
patches 0001 and 0003, while your patch 3/3 is adding patch 0002. This
is pretty odd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
