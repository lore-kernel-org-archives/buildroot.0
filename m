From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 01 Jul 2020 09:43:10 +0200
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <20200625130055.5062a0a0@windsurf>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200625130055.5062a0a0@windsurf>
Message-ID: <87ftabbrzl.fsf@FE-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

>> +$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
>> +$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
>> +$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
>> +$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
>
> These variables should be documented in the Buildroot manual.
>
> I see you set some default values for those CPE_ID values, but I am
> wondering if that's how we want to do this. Indeed a big question,
> which was discussed in a thread earlier this year between Michael
> Walle, Akshay Bhat and me is that how do we then distinguish packages
> for which the CPE information in Buildroot has been verified and is
> known to be correct, from packages that have the CPE information not
> verified, and even further from packages that don't have any CPE
> information because this specific package is not known in the NVD
> database.
>
> So I'd like to see a proposal that clarifies how we are going to handle
> this. One way is to *not* have any default value for those CPE
> variables, and add them to packages progressively, so that we know that
> when the CPE information is there, it _has_ been verified.
>
> It's not great because it means adding gazillions of CPE_ID information
> in packages. But is there any other option ?

I am working on a adding a tool allowing to check the cve status of a
given configuration. I am about to submit it. For now I base my check on
the buildroot package name as it is done in pkg-stat, but as you know
there are some mismatch. At a point there will be the need to use the
CPE information, so I have already had to think on how to manage it.

I already have to deal with failure when checking if a version was
affected by a CVE. And for this situation I choose to report that
failure instead of considering the package being affected or not by
default. The idea is to, later, be able to fix the failure but in the
meantime being aware of it.

For package name I would use a similar approach: if there is no CPE_ID
provided then try to use the package name but in this case report that
it has to be checked manually, while if there is a CPE_ID then use it as
a reliable name. So I am clearly in favor on the second option proposed
by Thomas. The ultimate goal is to have a CPE_ID information in each
package but in the meantime there is a path to achieve this.

Gregory

>
> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
