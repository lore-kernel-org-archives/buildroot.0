From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 07 Nov 2006 22:10:37 +0100
Subject: [Buildroot] Suggestion, Keep version in a separate file.
In-Reply-To: <c1096ed97bcbb70a39804f0aad20be24@bowery.com>
References: <byfTFYWKDbpt.qCRz32F5@mailout.dof.se>
	<c1096ed97bcbb70a39804f0aad20be24@bowery.com>
Message-ID: <4550F64D.5080808@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marc Lindahl skrev:
> On Nov 7, 2006, at 2:43 AM, Ulf Samuelsson wrote:
> 
>> That sounds like it would make the buildroot system overly complicated
>> for an rare edge case.
>> You can do that by managing your .config files - many ways to do that
>> already....
>>
>> => I really do not see
>>     how I can, using .config,
>>     select between
>>     package-1.18 and
>>     package-1.19 unless
>>     there is support for
>>     it in the Config.in files.
>>     (Which there isn't)
>>     so I have to use two
>>     different versions of
>>     buildroot and this is
>>     making life more
>>     complex.
>>
>>     Anyway, what's so complex
>>     about adding an extra
>>     include statement in
>>     the Makefile?
>>
>>     include $(BR2_VERSION_INFO)
> 
> one more thing that could cause serious confusion in the normal case...

Why is this confusing?
BR2_VERSION_INFO is set to ".version" as default.

> 
> 
>>     and set this to ".versions"
>>     in the main Config.in as
>>     default.
>>     If a user wants a different
>>     set of package versions
>>     then it is easy to select
>>     another file.
>>
>>     By using different .config
>>     files you easily can maintain different projects using different 
>> Version Info files.
>>
>>
>>     I doubt this is a corner
>>     case.  Anyone that is supporting more than one
>> project runs into this problem.
> 
> 
> I disagree that to manage separate projects within the same buildroot 
> tree makes any sense whatsoever.  It opens the opportunity that 
> unrelated projects could intermingle - cross-pollinating bugs, etc.

The goal is to have a single source for the buildroot, and
to allow the complete customer project to be deleted, with the exception
of the .config and the .version file.
It shall handle several versions for each customer and several customers
using this single source tree with minimal effort.

The current buildroot structure does not support this so
you have to have multiple buildroot tarballs and have to remember
which is used for which customer.

> I really for the life of me can't figure out why you'd want to do that 
> - normally you want a bunch of builds all using the same packages (e.g. 
> debugging, emulator, eval board, target hardware, etc.) - in which case 
> you really want to be sure that your packages are all the same, else 
> you debug a different version than you release!
> 
> perhaps you can give a real-world example or two?
> 
Customer A pays for a distribution, and the combination of packages is
thoroughly tested.
Customer B pays for a distribution one year later and a different
combination of packages is tested.
Customer A comes back and wants to have a new package added to his/her
distribution, but does not want to retest the rest.
Customer B comes back and wants to have a bugfix of <package>-1.18
This bugfix exists in <package>-1.22.

With the proposal, you can keep a single source code for buildroot
and just add a .config file and a .version file and you can reproduce
everything you did the last time.
For customer A, you edit the .version file <.version-customer-A-1.0>
to ensure that you have the desired version of the new package and
store in <.version-customer-A-1.1>. A new -.config file is generated to
include the new version file as well as the old.

For customer B, you edit the <.version-customer-B-1.0> file
to use <package>-1.22 and this is stored in <.version-customer-B-1.1>.
All new packages are built in build_<arch>_customer_B_V1.1

Everything can be maintained using a single source package.


> buildroot already supports the speed optimization to relocate the 
> package directory... you could have all your projects pointing to the 
> same one without the intermingling problem.
> 
> for separate projects why wouldn't you have separate buildroot trees - 
> I know I would for no other reason than the usual contractual 
> non-disclosures that come with consulting jobs.

You do not have to store the .config and .version files inside the
source package.
Also if there are customer specific packages, they can probably be
applied using a new directory "local" (similar to packages) which is
customer specific and stored outside the normal source package.


> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 297 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061107/25459d86/attachment.vcf 
