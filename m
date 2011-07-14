From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jul 2011 13:34:05 +0200
Subject: [Buildroot] [PATCH] Config: unbreak check-source caused by
	empty defconfigs
In-Reply-To: <201107141228.54544.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Thu, 14 Jul 2011 12:28:54 +0200")
References: <1310593649-26237-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <20110714101457.6521ebbd@skate>
 <201107141228.54544.yann.morin.1998@anciens.enib.fr>
Message-ID: <87ei1tcd02.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 Yann> That's because, 'source-check' spawns a second make to run '_source-check'
 Yann> which in turn runs a third make for 'source' with DL_MODE=SOURCE_CHECK

Ahh yes, so your problem is the first run - E.G. with annotation added:

diff --git a/Makefile b/Makefile
index 2f3802c..64bcafc 100644
--- a/Makefile
+++ b/Makefile
@@ -22,6 +22,7 @@
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
+$(warning MAKECMDGOALS=$(MAKECMDGOALS))
 
 # Set and export the version string
 export BR2_VERSION:=2011.08-git

We get:

make external-deps
Makefile:25: MAKECMDGOALS=external-deps
Makefile:25: MAKECMDGOALS=source

 Yann> Now, I wonder how to properly fix this.

 Yann> Either we check for 'source' and '_source-check', or we change
 Yann> the way '_source-check' behaves. I'll push a patch for the second
 Yann> case, so you can see what I have in my head about this... ;-)

We could probably combine source-check and _source-check, but as far as
I can see we would need to handle both source/source-check/external-deps

-- 
Bye, Peter Korsgaard
