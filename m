From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Jun 2016 23:26:36 +0200
Subject: [Buildroot] [PATCH v2] supertuxkart: new package
In-Reply-To: <CAAEAJfBj6qkUBFgvJhA67YZcMUS1qaEurapP+fJWa21oWGFQLA@mail.gmail.com>
References: <1463159188-1564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <ce50871b-7e0d-d540-6b08-cbb0a4a8fea3@mind.be>
 <CAAEAJfBj6qkUBFgvJhA67YZcMUS1qaEurapP+fJWa21oWGFQLA@mail.gmail.com>
Message-ID: <ea4be520-10d8-a999-a1ff-b886a0303293@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-06-16 23:15, Ezequiel Garcia wrote:
> Hi Arnout,
> 
> Sorry for the delay.
> 
> On 18 May 2016 at 18:52, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/13/16 19:06, Ezequiel Garcia wrote:
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
[snip]
>>> +comment "supertux needs a toolchain w/ NPTL, C++"
>>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>>> +               || !BR2_INSTALL_LIBSTDCPP
>>
>>
>>  You need to add the architecture dependencies here:
> 
> Sorry, not following you. You mean you want to restrict it to x86?

 We don't want the comment to appear on architectures for which the package
can't be built anyway. Otherwise, the user sees the comment, goes and selects
C++, and the comment disappears but the package still doesn't appear. So you
have to add:

> 
>>         depends on BR2_USE_MMU # fork()
>>         depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
>>
[snip]
>>> +# Locally computed
>>> +sha256 c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149
>>> supertuxkart-0.9.1-src.tar.xz
>>
>>
>>  There's a sha1 and md5 on sourceforge. We prefer to include those as well.
>>
>> # From
>> https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.1/
>> sha1  2208405a3a0f2117caf6ae00c24debb611ad7d2e
>> supertuxkart-0.9.1-src.tar.xz
>> md5  5d87d943f2e746043aed87dc80004701  supertuxkart-0.9.1-src.tar.xz
>>
>>  Also, preferably use two spaces to separate fields, like the output of
>> sha256sum.
>>
> 
> If we have sourgeforce hashes, is there any reason to
> keep the locally computed one?

 sourgeforce, hehe.

 Yes, we keep the locally computed one as well because md5 and sha1 are not
considered strong enough to be cryptographically secure. Although admittedly the
combination of the two is possibly as strong as sha256. But just to be safe, we
add a sha256.

[snip]
>>> +SUPERTUXKART_LICENSE = GPLv3
>>> +SUPERTUXKART_LICENSE_FILES = COPYING
>>
>>
>>  I didn't bother checking the licenses before, and of course it's
>> complicated. So I uploaded to fossology and it gets even worse :-)
>>
> 
> Nice!
> 
>>  First of all, it's GPLv3+.
>>
> 
> OK.
> 
>>  But then there are the bundled libraries. irrlicht, bullet and angelscript
>> have zlib license; glew is BSD-3c. Now, they all end up in a statically
>> linked binary, so I guess it's OK to keep it as GPLv3+ after all.
>>
> 
> OK, let's stick to GPLv3+.

 Forgot to mention it before: I do think it is best to still include the license
files for the bundled libraries, if available. But I'm not sure if the others
agree with that, because it also looks a little strange to say that the license
is GPLv3+ and then include a BSD-3c license file.

 For sure, add a comment explaining this, that the bundled libraries are BSD-3c
but since they are statically linked, the whole is anyway GPLv3+.


[snip]
>>  Finally, there's the issue of the bundled angelscript. AFAICS supertuxkart
>> supports an installed angelscript as well. But we don't have that package
>> yet, so ideally it should be added as a first patch in the series.
>>
>>  But I'm OK with using the bundled one for now.
>>
> 
> Cool, let's bundle it for now then.

 Mention this explicitly in the commit log, for future reference.

 Regards,
 Arnout

> 
> Thanks for the comments,
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
