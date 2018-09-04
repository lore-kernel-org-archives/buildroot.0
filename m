From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 23:09:39 +0200
Subject: [Buildroot] [PATCH 0/3] qt5webkit: fix build issue using system
 leveldb
In-Reply-To: <20180904151101.2vz46vm7q33scp4c@archlinux>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831231930.58f7ca3e@windsurf>
 <20180902202144.jmhaz6nz2gtk3n52@archlinux>
 <92bebe0f-479a-a17d-219c-834fadf318f3@mind.be>
 <20180904151101.2vz46vm7q33scp4c@archlinux>
Message-ID: <8d3a0660-0b08-65fb-06e8-179d640f307a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 17:11, Ga?l PORTAY wrote:
> Arnout,
> 
> On Tue, Sep 04, 2018 at 12:53:17AM +0200, Arnout Vandecappelle wrote:
>> (...)
>>
>>> Note: Also, since leveldb has moved to cmake, this symbol is now a part
>>> of libleveldb.so and there is not more libmemenv.a [2] :/
>>
>>  So, wouldn't a bump of leveldb which moves to cmake solve the issue entirely?
>>
> 
> First of all, the version is not yet out (1.21).

 OK, so we will not bump as a way to solve this issue. But the patch may be
reverted (or changed) after a leveldb bump.

> 
> I think, the bump will partially solve that issue (not tested, but I can
> give it a try).
> 
> With the bump, QtWebKit would compile it as a third-party (fair but not
> wanted) and would link against libleveldb.so which will be provided by
> buildroot (1.21 with the missing symbol). In that situation, the
> third-party is compiled but not used and the build will succeed.
> 
> If the configure flag WEBKIT_CONFIG+=use_system_leveldb is added,
> QtWebKit would not compile leveldb as a third-party (wanted) but it
> would try to link against libraries liblevel.db (okay) *AND* libmemenv.a
> from buildroot's staging. But the last one will not exist and the
> compilation would fail.

 In other words, after the leveldb bump, we'll still need patch 3/3 to avoid
building the bundled leveldb, *and* we need to add a patch to QtWebKit to avoid
linking with libmemenv. Gee...


> Even with the bump, (and if the configure flag is added) QtWebKit needs
> to be patched to remove the -lmemenv from the compilation line; because
> the libmemenv will disappear.
> 
> A good fix consists in to force QtWebKit to use its third-party library
> (giving the full path?) so it will not link against the copy from
> buildroot's staging.

 Ugh no we want to avoid bundled libraries.

> 
>>>> (...) 
>>>>
>>>> All in all, I'm just worried by the installation of what looks like
>>>> some internal library/headers of leveldb. Could you comment on this ?
>>>>
>>>
>>> We can consider memenv as an option of leveldb which installs the memenv
>>> development files (static library and header).
>>
>>  Since it's only a static library and a header, it only gets installed to
>> staging, not target, so there is no reason to make it optional.
>>
> 
> Okay, I will drop the option and respin a new version.

 Er, your current iteration doesn't have it as an option...

 Regards,
 Arnout

> 
>>  Regards,
>>  Arnout
>>
>>
>> [snip]
>>
>> -- 
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> Regards,
> Ga?l
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
