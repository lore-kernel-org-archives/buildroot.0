From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 18:21:25 -0200
Subject: [Buildroot] [PATCH v2] .gitlab-ci.yml: add trigger per job
References: <4cf9afed-0532-c3ad-d090-2fe43bc9b6cb@mind.be>
Message-ID: <5c44d845843bc_4b3e2b00552834648974@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jan 18, 2019 at 08:21 AM, Arnout Vandecappelle wrote:

[snip]
> On 16/01/2019 23:45, Ricardo Martincoski wrote:
> 
>> +aarch64_efi_defconfig:
>> +    <<: *defconfig
>> +    only:
>> +        - triggers
>> +        - tags
>> +        - /-defconfigs$/
>> +        - /-aarch64_efi_defconfig$/
> 
>  Since we have a nice pattern with the branch name here, I think we could
> instead rely on the branch name in the script and make a separate job for a
> single defconfig. Something like this:
> 
> build-one-defconfig:
>     only:
>         - /_defconfig$/
>     script:
>         ... Use some sedded version of ${CI_BRANCH_NAME} ...

Using a separate job is a great idea. It would even allow to easily not run the
check-* jobs when a single job is requested (something that Thomas suggested).

I will mark this patch as Changes Requested and resend.

> 
> Of course, you'd want to refactor that with the existing defconfig_script so it
> needs a little more work...
> 
> 
>  Completely independent of this, it would also be nice if the .gitlab-ci could
> be converted to use the "extends" keyword [1]. And also if the generated part

Sure. We can use "extends" instead of YAML anchors. It will make the .yml file
more readable and allow us...

> could be "include"d [2]. New gitlab features which weren't available when we

... to use "include" and avoid copying all the contents from .gitlab-ci.yml.in.
But ...

> created this. With that in place, it might even be possible to do this in a
> pipeline, where the included part is generated in the first stage - but I'm not
> sure if gitlab-ci supports that.

... no. Gitlab CI does not support generating .gitlab-ci.yml dynamically yet.
Let's hope this issue gets fixed:
https://gitlab.com/gitlab-org/gitlab-ce/issues/45828
There is already a prototype (I did not tested it):
https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/22219

Regards,
Ricardo
