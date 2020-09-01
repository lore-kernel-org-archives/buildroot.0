From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Sep 2020 08:52:42 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include
 Branches workflow
In-Reply-To: <20200831195201.GR14354@scaer>
References: <20200830155953.1650346-1-arnout@mind.be>
 <20200831124350.GP14354@scaer> <2388ea60-a8cb-9685-b075-11b1a49be9ff@mind.be>
 <20200831195201.GR14354@scaer>
Message-ID: <5b8d9396-564b-ab80-9b4a-11b0df51d26c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/08/2020 21:52, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2020-08-31 14:58 +0200, Arnout Vandecappelle spake thusly:
>>  Note that it's not the complicated conditions on the defconfig and test jobs
>> that are the issue. The warning is also issued for check-flake8... So I think
>> the workflow will still be needed (or alternatively, every job should have a
>> condition to run only on branches).
> 
> Sorry, but I don't follow: if the jobs are only generated when we want
> them, then they no longer have conditions in the generated gitlab-ci.yml
> to begin with; that's the whole point of moving the conditional handling
> into the script.

 Ah, OK, I thought it was just about generating the defconfig and tests parts.
My bad.

>> On 31/08/2020 14:43, Yann E. MORIN wrote:
[snip]

> 
> See an actual comment on that patch, below...
> 
>>>> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
>>>> index dddebf09e9..8a031898ef 100644
>>>> --- a/support/misc/gitlab-ci.yml.in
>>>> +++ b/support/misc/gitlab-ci.yml.in
>>>> @@ -1,6 +1,9 @@
>>>>  # Configuration for Gitlab-CI.
>>>>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>>>>  
>>>> +include:
>>>> +  - template: 'Workflows/Branch-Pipelines.gitlab-ci.yml'
> 
> Where does that file come from? How are we guaranteed that its content
> does not change and break our pipelines?
> 
> If that template is interesting, then we should carry it rather than
> depend on an external, un-managed entity...

 It is part of the gitlab installation. That means that indeed it is not under
our control, but neither is the rest of gitlab (e.g., the part that generates
those warnings :-). In other words: it's about as reliable as the rules clauses
we have now.

 Note that the workflow file is indeed very simple, and we could simply
instantiate it here.

 Again, though, in order to expedite the 2020.08 release, I propose to apply
this simple patch to master, and soon after merge your series that makes it
script-based - possibly backporting it to the stable branches, though I don't
really think that is needed.

 Regards,
 Arnout
