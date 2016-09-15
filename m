From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 23:09:41 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <CALe+oY9axTFL77OUxOECnnhakrn8CGQtiznYBbjhFNdQP4HCTQ@mail.gmail.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <b35ba70e-9552-577c-0bea-4a50e6b5fe4a@mind.be>
 <CALe+oY-xM=Jqk17OH199Ow6wGcF193M3iKgbuYs6s7CPyKAFBw@mail.gmail.com>
 <CALe+oY9axTFL77OUxOECnnhakrn8CGQtiznYBbjhFNdQP4HCTQ@mail.gmail.com>
Message-ID: <dba92d1d-2ec3-c404-a87f-66dd1df9e3be@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 17:50, James Knight wrote:
> On Mon, Sep 12, 2016 at 6:22 PM, James Knight
> <james.knight@rockwellcollins.com> wrote:
>>
>>>> +     --disable-largefile \
>>>
>>>  Why disable? Probably needs a comment in commit message or in .mk file.
>>
>> Actually, I cannot recall. I'll investigate and add an appropriate
>> correction or comment.
> 
> Actually, from the subset of builds I've tried, it seems to work
> without this option set (I'll do more testing once I cleaned up the
> entire patch).
> 
> That being said, I believe I added the option to help explicitly
> define as many configurations as possible for the package. I recall
> being told that the more options you can explicitly set, the better.

 Yes that's true, but the surprising thing is that you pass --disable-largefile
while Buildroot always enables largefile:

TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64


> Looking for example in Buildroot, I don't really see (or just can't
> find) any generic configuration option which indicates the target
> system supports large files (to explicitly enable/disable large file
> support). If it's better just to remove the option and let defaults
> take place, I don't mind. Just looking for an opinion on the best
> approach.

 See CHANGES, 2015.05-rc1:

Toolchains: IPv6 and Largefile support now enforced for uClibc. Corresponding
Kconfig symbols removed.


> 
>>
>>>> +     --enable-python=no \
>>>
>>>  Doesn't --without-python or --disable-python work?
>>
>> Most likely does; will cleanup.
> 
> After examining the configure[.ac] files, it seems that only the
> `enable-python` option is checked. 

configure.ac has AC_ARG_ENABLE(python, ...) so --disable-python *should* work.
But perhaps they've got some other perversion going on there that breaks it.


> By default, Python features are not
> enabled. If the `enable-python` option is inconsistent with options
> usually applied, I can just remove it and nothing should really
> change; but this goes back to my previous comment on whether or not we
> want to explicitly set all/most configuration options or leaving it to
> implicitly configure the package.

 It should be explicitly set. It's just that we have the convention of using
--disable-foo or --without-foo, rather than --enable-foo=no or --with-foo=no.



> On Tue, Sep 13, 2016 at 2:29 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>>  Oh, and there's an active upstream at
>>>>> https://github.com/rpm-software-management/rpm
>>>>> Could you submit it there (if still relevant)?
>>> I'll investigate this. I won't be able to try this until next month or
>>> so, so I hope having these patches for now will suffice/causes no
>>> complaints.
>>
>>  No worries.
> 
> On a plus note, they've pulled in Thomas's the first patch upstream
> [1] (yay); the second one doesn't really apply anymore due to several
> changes on the HEAD. I wonder if they ever plan to do another release
> in the future (I'll try pinging some individuals). At least for now,
> I'll be hoping to cleanup this current patch and submit it again.
> 
> Maybe, in the future, if no official release will ever be made, I can
> try an attempt too pull a stable hash from GitHub and do a series of
> tests to make sure everything is stable enough. Then we can drop these
> additional patches.

 Fedora seems to use the 4.13.0-rc1, so I guess it should be doable. But of
course, that one doesn't allow to drop the patches...

 Regards,
 Arnout

> 
> [1]: https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
