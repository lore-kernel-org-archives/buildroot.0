From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 4 May 2016 23:26:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <bbbedfcc-6c2f-4441-95ad-543ea1c53fef@mind.be>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
 <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
 <CALupW3B76bWmAnLSLAizMgZBGwig5Gm6o3dG9q5ydtEaSyqqpw@mail.gmail.com>
 <bbbedfcc-6c2f-4441-95ad-543ea1c53fef@mind.be>
Message-ID: <CAHXCMML55cnFBZ2i+PNuRxX08rtAb5BTnCiL+OY7h2zQ6QSYvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, Arnout,

On Wed, May 4, 2016 at 7:02 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/04/16 18:12, Steve deRosier wrote:
>>
>> On Tue, May 3, 2016 at 10:23 AM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>>>
>>> On 05/02/16 23:35, Steve deRosier wrote:
>>>>
>>>>
>>>> Hi Samuel,
>>>>
>>>> Thanks for taking a detailed look at this. Hopefully my answers below
>>>> will address your concerns.
>>>>
>>>>
>>>> On Mon, May 2, 2016 at 12:44 PM, Samuel Martin <s.martin49@gmail.com>
>>>> wrote:
>>>>>>
>>>>>>
>>>>>> +
>>>>>> ++# Options to control if we build static or shared libraries. Needed
>>>>>> because
>>>>>> ++# cmake has us explicitly do both versions if we want both versions.
>>>>>> ++option(FLATCC_WITH_STATIC "Build the static version of the library"
>>>>>> ON)
>>>>>> ++option(FLATCC_WITH_SHARED "Build the shared version of the library"
>>>>>> ON)
>>>>>
>>>>>
>>>>> I'm not a big fan of this because:
>>>>> - it kinda adds some feature to flatcc;
>>>>> - it completely by-passes the standard CMake way of driving
>>>>> shared/static libs build (using BUILD_SHARED_LIBS) that the Buildroot
>>>>> infrastructure automaticllay set [1].
>>>>>
>>>>
>>>> I wish you spoke up two weeks ago when Arnout explicitly asked me to
>>>> add the shared+static to the build. You could've saved me a good week
>>>> of work and two weeks delay in getting support for this upstreamed.
>>>
>>>
>>>
>>>  Well, I was just talking about your custom install commands. I didn't
>>> realize that in the shared+static case, the static libs weren't even
>>> built.
>>> I just noticed in your code that for a config variable that can have
>>> three
>>> values (static, shared, static+shared) you only handled two (static,
>>> others). So I made the remark that you forgot about the static+shared
>>> case,
>>> with a suggestion about how it could be handled.
>>>
>>
>> OK, understood. I guess I could've responded then that it doesn't
>> build both and put some code in there to eliminate that case. Sorry, I
>> misunderstood the review.
>>
>> But, now the work's been done to handle the extra case. I'd like see
>> it go in with the extra functionality as we're going to upstream the
>> feature anyway.
>>
>> @Samuel and @Arnout, does that plan sound OK? Can we move forward with
>> this?  Or are there other things that I need to address?

IMHO, the install rule fix is more critical than the shared+static libs support.
For backported patches, it is ok.
For feature patches: it depends how big are the patches, if they have
been submitted, how confident we/you feel it is gonna make it
upstream... But when the submitter is actively working with upstream
to merge the patches, I don't see any reasons to obstruct it
integration in BR..

>
>ed
>  Hm, tricky...
>
>  On the one hand, I don't want to block your submission over this issue.
>
>  On the other hand, we don't want to carry a feature patch that may never be
> accepted upstream.

Well, your first submission is by far simpler than the second one!

>
>  Since the patch wasn't OK yet as it was (it should look at the global
> BUILD_SHARED_LIBS), isn't it easier to just drop that patch, and revert the
> installation commands to your original version, adding a comment that in the
> SHARED_STATIC case only shared libs are built anyway? Or is that too
> frustrating because you did redundant work?

I would suggest to make flatcc get in BR with a simple patch (just
backport the install rule fix and a trivial shared+static libs support
behaving as the shared only libs one, with some comments).
In parallel, keep working with upstream. Once this is merged upstream,
it will be easier for you to update the package in BR.

>
>  I can understand that it's frustrating. Actually, reading back what I wrote
> yesterday, I'm afraid that I may have made it worse by making you feel it
> was your own fault. But that's not at all the case: I haven't been
> sufficiently clear in my original review, and you can't magically know all
> the constraints that we try to satisfy.

Steve, I'm truly sorry if you feel frustrated about this, don't be!
Your work is valuable, and definitely not a waste of time. Just BR was
not the right place were to submit this ;-)
In the end, what is important is that things get in the place where
they belong, and that everyone can benefit from them.

Regards,

-- 
Samuel
