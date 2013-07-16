From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:39:19 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
	beaglebone_defconfig
In-Reply-To: <20130716153258.1f2c3201@skate> (Thomas Petazzoni's message of
 "Tue, 16 Jul 2013 15:32:58 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wa1w3b.fsf@dell.be.48ers.dk> <20130716153258.1f2c3201@skate>
Message-ID: <87bo62zks8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Tue, 16 Jul 2013 15:19:04 +0200, Peter Korsgaard wrote:

 >> Did you test build this? I had a beaglebone derived config (but with
 >> latest linaro), and u-boot failed to build with:

 Thomas> Yes, I tried beaglebone_defconfig, which uses an internal toolchain...
 Thomas> which would not exhibit this problem.

Ok, good. Then I'll commit it.


 Thomas> Unfortunately, I'm not sure how to fix this particular problem. It's
 Thomas> gcc that is too stupid to understand that -msoft-float appearing in the
 Thomas> command line after -mfloat-abi=hard should take precedence over
 Thomas> -mfloat-abi=hard. I believe we already had this case in the past, maybe
 Thomas> not specifically with those options, but with other options.

 Thomas> One solution I see to this is not very nice:

 Thomas> 	if (gcc command line contains -msoft-float) {
 Thomas> 		do not pass -mfloat-abi and -mfpu arguments
 Thomas> 	}

You mean in the toolchain wrapper? Yddrk.


 Thomas> The other solution is to simply not pass -mfloat-abi=hard, assuming the
 Thomas> toolchain would by default generate such binaries, which should be the
 Thomas> case because EABI and EABIhf are not compatible. However, we should
 Thomas> still pass -mfloat-abi=soft/softfp as needed.

That could work, but also doesn't sound really nice. Presumably gcc
doesn't complain about -mfloat-abi=softfp -mfloat-abi=soft as those are
compatible.


 Thomas> That makes me think that I should maybe add a check that ensures that
 Thomas> the ABI selection (EABI/EABIhf) matches the one provided by the
 Thomas> external toolchain (which is useful when custom external toolchains are
 Thomas> used).

That would be a nice addition, yes.

-- 
Bye, Peter Korsgaard
