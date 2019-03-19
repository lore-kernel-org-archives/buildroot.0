From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:51:07 +0100
Subject: [Buildroot] [PATCH v8 1/3] openjdk: new package
In-Reply-To: <20190315205233.128763-1-aduskett@gmail.com>
References: <20190315205233.128763-1-aduskett@gmail.com>
Message-ID: <20190319225107.707b903f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 15 Mar 2019 16:52:31 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> OpenJDK is a free and open-source implementation of the Java Platform.
> This package provides the option to build a client or a server JVM interpreter.

Since it was merged, this package caused a few build issues (but not
that many). I had a quick look in order to hopefully help resolving
them:

 - http://autobuild.buildroot.net/results/a03/a034e641fe163d4502fd9411af1d96c14d13c5f2/build-end.log
   http://autobuild.buildroot.net/results/84f/84f423cc795ce0957801a5f7b35c0c800f527fb1/build-end.log

   These are the same, the host machine tuple is not recognized. I
   believe the fix is as easy as adding a POST_PATCH_HOOKS that copies
   support/gnuconfig/config.sub over $(@D)/make/autoconf/build-aux/autoconf-config.sub

 - http://autobuild.buildroot.net/results/f76/f763193801c4af8289c49832811395df49b1b876/build-end.log

   This one has stuff like error: unknown type name
   'snd_rawmidi_stream_t'; did you mean 'snd_pcm_stream_t'?. The problem is that the configuration has 
   BR2_PACKAGE_ALSA_LIB_RAWMIDI disabled. I would recommend you to make
   a build of OpenJDK with BR2_PACKAGE_ALSA_LIB=y but all its
   sub-options disabled, and see which sub-options are mandatory for
   OpenJDK to build. Then you can add the relevant select
   BR2_PACKAGE_ALSA_LIB_foobaz to openjdk/Config.in

 - http://autobuild.buildroot.net/results/9d2/9d27e6389a18ddf4266511b58e827487d4a78437/build-end.log

   This one is some weird OpenJDK specific stuff, I can't really help
   here.

 - http://autobuild.buildroot.net/results/633/633b2361f7ab588fcc41fcbf5e92aa4eca895c6a/build-end.log

   Same for this one.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
