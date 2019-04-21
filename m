From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Apr 2019 09:11:18 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: add chmod before rm when
 cleaning.
In-Reply-To: <CALvytycy9-K6q-vRLaJ3a6OGBoAQU3hYiTkOeV-KCmpAKkawjQ@mail.gmail.com>
References: <20190417000931.5356-1-louis.deslandes@fleet.space>
 <339b8a2c-0557-e5ba-d153-5012b2773c4b@mind.be>
 <CALvytycy9-K6q-vRLaJ3a6OGBoAQU3hYiTkOeV-KCmpAKkawjQ@mail.gmail.com>
Message-ID: <387cecae-029a-c6cb-7bd8-5901240ef8ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/04/2019 02:14, Louis des Landes wrote:
> On Thu, 18 Apr 2019 at 06:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 17/04/2019 02:09, Louis des Landes wrote:
>>> Some build systems (looking at you golang) create read only directories
>>> as caches.
>>> As such rm -rf will actually fail, causing clean and <pkg>-dirclean to fail.
>>>
>>> This patch will cause `make clean` to run chmod -R +w on the relevant
>>> directory first, which will allow rm -rf to work.
>>>
>>> This may be resolved if https://github.com/golang/go/issues/31481 is
>>> resolved satisfactorily.
>>
>>  I don't like this very much - adding a go-specific workaround to the generic
>> infrastructure.
>>
>>  Would it be acceptable to instead do the chmod as a POST_BUILD_HOOK that is
>> added by golang-package?
> I kind of agree, and this is somewhat of a hack. POST_BUILD_HOOK
> doesn't get triggered if the build fails (AFAIK) so
> a failed build would still leave this directory lying around without
> being chmod'd. Might still be a good addition though.

 Yeah, better yet would be to patch go to remove that "feature". Long-term
that's anyway what we expect, right? That the go tool learns some option to not
do the chmod?

 Regards,
 Arnout

> 
>>
>>  I also don't understand that I haven't encountered this issue myself... Maybe I
>> don't build Go packages...
> This 'feature' was introduced with 'module' support (
> https://github.com/golang/go/wiki/Modules )
> Previously there was no official dependency management, so unless
> you're building recent go packages you won't encounter this issue.
> In most other ways this module support is great. In this particular
> respect it's annoying for build systems.
> 
>>  Regards,
>>  Arnout
>>
>>>
>>> Signed-off-by: Louis des Landes <louis.deslandes@fleet.space>
>>> ---
>>>  Makefile | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 522c0b0606..fc2a82e074 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1060,6 +1060,12 @@ printvars:
>>>
>>>  .PHONY: clean
>>>  clean:
>>> +     # Some build systems (looking at you golang) create read only directories
>>> +     # As such rm -rf will actually fail, so brute force them all to writeable
>>> +     # before removing them.
>>> +     chmod -R u+w $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
>>> +             $(BUILD_DIR) $(BASE_DIR)/staging \
>>> +             $(LEGAL_INFO_DIR) $(GRAPHS_DIR)
>>>       rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
>>>               $(BUILD_DIR) $(BASE_DIR)/staging \
>>>               $(LEGAL_INFO_DIR) $(GRAPHS_DIR)
>>>
