From: Marc Lindahl <marc@bowery.com>
Date: Tue, 14 Nov 2006 16:00:19 -0500
Subject: [Buildroot] Suggestion, Keep version in a separate file.
In-Reply-To: <4550F64D.5080808@atmel.com>
References: <byfTFYWKDbpt.qCRz32F5@mailout.dof.se>
	<c1096ed97bcbb70a39804f0aad20be24@bowery.com>
	<4550F64D.5080808@atmel.com>
Message-ID: <207d4508d3abc304c985fc7dd2b7a2f8@bowery.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Nov 7, 2006, at 4:10 PM, Ulf Samuelsson wrote:

> Marc Lindahl skrev:
>>
>> one more thing that could cause serious confusion in the normal 
>> case...
>
> Why is this confusing?
> BR2_VERSION_INFO is set to ".version" as default.

When something goes wrong, it's a subtle change that can cause havoc, 
supporting only this odd corner case.  (e.g. what if it's missing and 
shouldn't be, what if it's slightly mis-named, etc. etc.)

>> I disagree that to manage separate projects within the same buildroot
>> tree makes any sense whatsoever.  It opens the opportunity that
>> unrelated projects could intermingle - cross-pollinating bugs, etc.
>
> The goal is to have a single source for the buildroot,

For every project you do?  I disagree with that as a useful goal.

>  and
> to allow the complete customer project to be deleted, with the 
> exception
> of the .config and the .version file.
> It shall handle several versions for each customer and several 
> customers
> using this single source tree with minimal effort.

Sounds confusing already.

>
> The current buildroot structure does not support this so
> you have to have multiple buildroot tarballs and have to remember
> which is used for which customer.

How is that hard?  If you can't remember the customer...
In any case typically there is more than buildroot for a project, 
there's hardware, tons of other odds and ends... it's likely there's a 
whole directory structure for each customer.


>
>> I really for the life of me can't figure out why you'd want to do that
>> - normally you want a bunch of builds all using the same packages 
>> (e.g.
>> debugging, emulator, eval board, target hardware, etc.) - in which 
>> case
>> you really want to be sure that your packages are all the same, else
>> you debug a different version than you release!
>>
>> perhaps you can give a real-world example or two?
>>
> Customer A pays for a distribution, and the combination of packages is
> thoroughly tested.
> Customer B pays for a distribution one year later and a different
> combination of packages is tested.
> Customer A comes back and wants to have a new package added to his/her
> distribution, but does not want to retest the rest.

Changing a package without restesting the release??

> Customer B comes back and wants to have a bugfix of <package>-1.18
> This bugfix exists in <package>-1.22.
>
> With the proposal, you can keep a single source code for buildroot
> and just add a .config file and a .version file and you can reproduce
> everything you did the last time.
> For customer A, you edit the .version file <.version-customer-A-1.0>
> to ensure that you have the desired version of the new package and
> store in <.version-customer-A-1.1>. A new -.config file is generated to
> include the new version file as well as the old.
>
> For customer B, you edit the <.version-customer-B-1.0> file
> to use <package>-1.22 and this is stored in <.version-customer-B-1.1>.
> All new packages are built in build_<arch>_customer_B_V1.1
>
> Everything can be maintained using a single source package.

This whole scenario mixes together customer A and B, which is 
customarily a bad idea, both in practice, and usually prohibited by 
NDAs and the like.

No benefit in organization or storage...

Also no consideration was made for CVS or other version control - each 
customer has a separate repository.


>
>
>> buildroot already supports the speed optimization to relocate the
>> package directory... you could have all your projects pointing to the
>> same one without the intermingling problem.
>>
>> for separate projects why wouldn't you have separate buildroot trees -
>> I know I would for no other reason than the usual contractual
>> non-disclosures that come with consulting jobs.
>
> You do not have to store the .config and .version files inside the
> source package.
> Also if there are customer specific packages, they can probably be
> applied using a new directory "local" (similar to packages) which is
> customer specific and stored outside the normal source package.
>

So now you have one combined tree for all your customers - except you 
have separate trees elsewhere to hold separate .config and .version 
files?

Well, you made my case for me!

M


>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>
> <ulf.vcf>
