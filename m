From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Dec 2016 00:46:58 +0100
Subject: [Buildroot] LibreSSL support?
In-Reply-To: <CAGduivzjh5WNn_0do-A5L0FvoNh7hDEOxN1SiXH0HZya12YYAA@mail.gmail.com>
References: <20161205223300.GA5002@itchy>
 <CAGduivzjh5WNn_0do-A5L0FvoNh7hDEOxN1SiXH0HZya12YYAA@mail.gmail.com>
Message-ID: <523f5481-456b-acc6-1c37-6076635db4d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 23:36, Maxime Hadjinlian wrote:
> Hi Eric, all
> 
> On Mon, Dec 5, 2016 at 11:33 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
>> Hi all!
>>
>> Are there any plans for adding support for LibreSSL?
>>
>> I've found a patch [1] in patchwork, from M. Hadjinlian, posted two
>> years ago. The review concludes with the need for the introduction of a
>> virtual package, as LibreSSL uses the same names for its binaries and
>> libraries as OpenSSL (openssl, libcrypto, libssl and libtls).
> Well the problem is that LibreSSL is *NOT* a real drop in replacement
> of OpenSSL, so you would need to add a new package and we need to
> figure a way to have a generic way to say that a package provide SSL,
> like we have for GLES or others, and change/replace everything in the
> package that needs ssl *but* since LibreSSL is not a perfect drop-in,
> some package won't build with it. So it's on a case by case.

 We have the same with lua/luajit. They are more or less compatible but not
completely. So we add explicit dependencies when necessary, and use the virtual
package when both are possible.

 I would propose to start with assuming libressl works, and fix autobuild
failures when they occur.

> 
> Of course, a good first step, would be to simply add the package and
> include it with a few packages that works and see how it goes.
>>
>> So, what would be the best solution:
>>
>> a)
>>   1. introduce the virtual package openssl-compat.
>>   2. make libressl and openssl provide openssl-compat.
>>   3. update all packages depending on/selecting openssl to depend on/select
>>      openssl-compat.
>>
>> b)
>>   1. rename openssl to openssl-genuine.
>>   2. introduce virtual package openssl.
>>   3. make openssl-genuine and libressl provide openssl.

 I expect most packages *will* work with libressl, so I think option b is
better. Step 1 and 2 will have to be done in a single patch, BTW, otherwise you
have to change all current uses of BR2_PACKAGE_OPENSSL first...

 Since there are a lot of 'select BR2_PACKAGE_OPENSSL', you'll have to use a
trick like libjpeg/jpeg-turbo to automatically select one.

 Regards,
 Arnout


>>
>> Comments and suggestions welcome.
>>
>> [1] https://patchwork.ozlabs.org/patch/398963/
>>
>> --
>> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
