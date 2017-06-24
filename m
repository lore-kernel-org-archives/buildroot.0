From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jun 2017 00:38:11 +0200
Subject: [Buildroot] [PATCH v2 2/4] libssl: new virtual package
In-Reply-To: <20170624214528.15f8cc18@windsurf.home>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <20170624172900.3610-2-Adamduskett@outlook.com>
 <20170624214528.15f8cc18@windsurf.home>
Message-ID: <fbd63a92-1900-639b-7653-ebb1f70cc137@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 21:45, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 24 Jun 2017 13:28:58 -0400, Adam Duskett wrote:
>> libressl is API compatible with OpenSSL 1.0.1 and is almost API
>> compatible with OpenSSL 1.0.2.  As such, a new virtual package is needed
>> to handle having both libressl and openssl.
>>
>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>> ---
>> Changes v1 -> v2:
>>   - Removed final "." in commit title. (Thomas)
>>   - Fixed indentation issues in commit message.
> 
> I still don't get what is the plan for this virtual package. We have
> two options:
> 
>  - Make it a regular virtual package, like package/opengl/libgles/.
>    However in this case, we must change all packages that need
>    OpenSSL/LibreSSL to use a "depends on BR2_PACKAGE_LIBSSL", which is
>    a bit annoying.

 It can also be
	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
but then the advantage of a virtual package is almost gone...

> 
>  - Make it a virtual package like package/jpeg/, where it has a choice
>    to define which jpeg implementation should be used. This nicely
>    allows packages to "select BR2_PACKAGE_LIBSSL".

 Yeah, I like the second option more and more. One big problem though: it's
difficult to migrate, because *all* the 'select BR2_PACKAGE_OPENSSL" have to be
converted into "select BR2_PACKAGE_LIBSSL"... So starting like this and
introducing the choice later seems to be the most viable approach.


> Also, how are we going to handle the fact that some packages support
> only OpenSSL, while some support both OpenSSL and LibreSSL.

 With the regular virtual package you can just do
	select BR2_PACKAGE_OPENSSL
and then you get an error as soon as you try to build if libressl is selected. I
think adding a depends on !libressl leads to a circular dependency then.

 With the choice, you need
	select BR2_PACKAGE_LIBSSL
	depends on !BR2_PACKAGE_LIBRESSL	
which hopefully isn't considered a circular dependency.


 Regarding BoringSSL, putting it as the third libssl provider looks like the way
to go to me.

 Regards,
 Arnout


> Even if all of this doesn't get implemented in the first series, I
> still would like to understand what the plan is.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
