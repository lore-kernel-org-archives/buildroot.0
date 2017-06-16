From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 16 Jun 2017 08:43:57 -0400
Subject: [Buildroot] [PATCH 2/5] libssl: new virtual package.
In-Reply-To: <bf80e20f-0e71-258b-a60f-2b01f6f46909@mind.be>
References: <20170615142928.31927-1-aduskett@codeblue.com>
 <20170615142928.31927-2-aduskett@codeblue.com>
 <20170615232816.121a18b9@windsurf.lan>
 <bf80e20f-0e71-258b-a60f-2b01f6f46909@mind.be>
Message-ID: <CAFSsvmrQLDmptGh8PoUgG0rO2VkVQYNOXJw4QzxKYox5M0LLTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys;

On Thu, Jun 15, 2017 at 6:54 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 15-06-17 23:28, Thomas Petazzoni wrote:
>> Hello,
>>
>> Nit: don't use a final "." in the commit titles.
>>
>> On Thu, 15 Jun 2017 10:29:25 -0400, Adam Duskett wrote:
>>>     libressl is API compatible with OpenSSL 1.0.1 and is almost API compatible
>>>     with OpenSSL 1.0.2.  As such, a new virtual package is needed to handle
>>>     having both libressl and openssl.
>>
>> No indentation of 4 spaces for the commit log.
>>
Sorry about that, copy and paste issues. :)


>>> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
>>> new file mode 100644
>>> index 0000000..71347de
>>> --- /dev/null
>>> +++ b/package/libssl/Config.in
>>> @@ -0,0 +1,6 @@
>>> +config BR2_PACKAGE_HAS_LIBSSL
>>> +    bool
>>> +
>>> +config BR2_PACKAGE_PROVIDES_LIBSSL
>>> +    string
>>> +    depends on BR2_PACKAGE_HAS_LIBSSL
>>
>> Should it be named "libssl" or "ssl". I think Arnout suggested just
>> "ssl" on IRC, didn't he?
>>
The reason I went with libssl instead of ssl is because openssl is in
the library/crypto config.
Same with libressl.  As such I figured this should be named libssl.

>> Also, I believe for this package we should use the jpeg/jpeg-turbo
>> model instead of the conventional virtual package model, because we
>> want to be able to "select BR2_PACKAGE_LIBSSL". As your package is done
>> today, we would *have* to use only a "depends on BR2_PACKAGE_LIBRESSL",
>> which is a bit annoying.
>
>  Hm, I'm not sure I agree. The problem with that is that existing configs won't
> work anymore, i.e. if you have openssl selected and run menuconfig, it will
> disappear because it now depends on libssl and libssl isn't selected...
>
>  And any package that can have either can just do
>
>         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
>
This is what I would prefer because as discussed in IRC, there are many packages
that are yet compatible with libressl.  Any objections?

>
>  If we really want to make it a choice like libjpeg, then I think openssl should
> be renamed so existing configs still work. And that solves the naming issue too
> :-) Well, except that we have to find a name for the original openssl package :-P
>
libopenssl Kind of sounds funny. :)?

>  Regards,
>  Arnout
>
>>
>> Again, see the libjpeg virtual package.
>>
>> Best regards,
>>
>> Thomas
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
