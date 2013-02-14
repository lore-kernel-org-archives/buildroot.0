From: Dimitrios Siganos <dimitris@siganos.org>
Date: Thu, 14 Feb 2013 16:18:32 +0000
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <20130214085749.09ce593b@skate>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
 <511C1A3F.2080804@mind.be> <20130214001404.199dbd64@skate>
 <511C1FE8.60103@mind.be> <20130214085749.09ce593b@skate>
Message-ID: <511D0E58.2040308@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/13 07:57, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 14 Feb 2013 00:21:12 +0100, Arnout Vandecappelle wrote:
> 
>>   It's not that it's impossible to solve, it's just inconvenient and 
>> counter-intuitive. It's also inconvenient to have two U-Boot versions
>> in your legal-info output. Just like it's inconvenient to have two
>> linux tarballs.
> 
> Indeed, but what solution do you propose?
> 
> Thomas

The ideal scenario that I am picturing is this.

* Add an option to uboot (let's call it UBOOT_BUILD_ENV_TOOLS), to
additionally do the work that is currently done by uboot-tools.

* Add an option to uboot-tools to make it a "virtual" package (let's
call it UBOOT_TOOLS_VIRTUAL) that tells uboot-tools to do nothing
because uboot will do all the work. The virtual package is needed so
that the dependency chains can lead to uboot.

* Turning on virtual mode in uboot-tools also turns on uboot
UBOOT_BUILD_ENV_TOOLS.

* The uboot-tools virtual package would add uboot as a dependency if
UBOOT_TOOLS_VIRTUAL is on.

I do not have much hands-on experience on this so I could talking
rubbish. Please let me know if I am talking rubbish.

In the mean time, the practical way to ensure building from both sources
is to set:

UBOOT_VERSION equal to UBOOT_TOOLS_VERSION
UBOOT_SITE equal to UBOOT_TOOLS_SITE
UBOOT_METHOD equal to UBOOT_TOOLS_METHOD

However, because uboot has many more options for setting SITE and
METHOD, it is currently not always possible to set them to pull the same
sources without patching buildroot. I currently get uboot from a git repo.

If I created a patch to give uboot-tools the same pull options as the
uboot package, would you accept it (if it passes review of course)?

Regards,
Dimitris
