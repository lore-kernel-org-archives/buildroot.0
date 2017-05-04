From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 May 2017 08:55:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-29
In-Reply-To: <20170503150243.72d66fb9@free-electrons.com>
References: <20170430062822.F06D82097E@mail.free-electrons.com>
 <20170503102922.GB26389@argentina>
 <20170503142939.3fc6a470@free-electrons.com>
 <20170503124713.GA17301@shattrath>
 <20170503150243.72d66fb9@free-electrons.com>
Message-ID: <223d1087-7158-2bce-b145-774a871f1911@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-05-17 15:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 3 May 2017 14:47:13 +0200, Richard Braun wrote:
> 
>>> Richard have you updated your autobuild-run script recently?  
>>
>> My builder should be running with version 6986aa15ed966e16312ebaef1a47f498ca76a197.
>>
>> It is automatically updated and restarted once a week.
> 
> Then you are running with the latest changes from Arnout, and most of
> the other autobuilder slaves are not, which is why we only see this
> issue coming from your autobuilder.
> 
> So, this confirms my hypothesis that the bug is in the changes from
> Arnout :-)

 The problem is that that defconfig file (sourcery-arm-thumb2.config) doesn't
specify which toolchain to use:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_OPTIMIZATION=""

It just relies on the default external toolchain.

 Obviously this isn't very robust to begin with: when the external toolchains
change, this could implicitly change this toolchain defconfig. E.g. imagine that
Linaro would grow a Thumb2 option, then suddenly this sourcery-arm-thumb2.config
would build using a Linaro toolchain...

 So I think the solution is to explicitly add the predefined external toolchain
to use to all the toolchain configs. I'll try to send a patch for that.

 BTW, I notice now that we don't have configs for the Codescape toolchains. Any
reason for that?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
