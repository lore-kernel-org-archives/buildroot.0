From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jul 2015 14:21:02 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <1436527712.2800.46.camel@synopsys.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
 <559EE7E6.401@mind.be> <20150710084455.3462000c@free-electrons.com>
 <1436515926.2800.26.camel@synopsys.com> <559F99A1.8060501@mind.be>
 <1436527712.2800.46.camel@synopsys.com>
Message-ID: <559FB8AE.7020302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/15 13:28, Alexey Brodkin wrote:
> Hi Arnout,
> 
> On Fri, 2015-07-10 at 12:08 +0200, Arnout Vandecappelle wrote:
>> On 07/10/15 10:12, Alexey Brodkin wrote:
>> [snip]
>>
>>  Thanks for the detailed explanation!
>>
>>> In other words if we disable PIE in Buildroot's toolchain there will be
>>> no way to build U-Boot for ARC. And that's not what we want.
>>
>>  It's probably getting complicated, but we could add either another option or an
>> environment variable to enable PIE again. E.g. if it's an envrionment variable,
>> then we can do for packages that we know do *not* break with ARC-PIE:
>>
>> ifneq ($(BR2_arc),)
>> UBOOT_MAKE_ENV += GCC_REALLY_SUPPORT_PIE=1
>> endif
> 
> We may add that new definition but the question is how it is supposed to work?
> My understanding is once we have gcc built with PIE support it [gcc] will happily
> accept "-pie" flag in command-line and will generate output accordingly.

 What I mean is that we patch gcc and only support the pie option if that magic
environment variable is set.

 But looking at the source, that's not going to be easy since the whole command
line parsing is abstracted in a way that makes it difficult to hack something
like that.

 Perhaps another solution is that we disable -pie in the spec file, and pass an
alternative spec file which does have pie support in U-Boot:

UBOOT_MAKE_OPTS += \
	CC="$(TARGET_CC) -specs=path-to-specfile-with-pie"


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
