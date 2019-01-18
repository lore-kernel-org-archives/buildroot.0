From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Jan 2019 11:21:37 +0100
Subject: [Buildroot] [PATCH v2] .gitlab-ci.yml: add trigger per job
In-Reply-To: <20190116224556.8619-1-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-4-ricardo.martincoski@gmail.com>
 <20190116224556.8619-1-ricardo.martincoski@gmail.com>
Message-ID: <4cf9afed-0532-c3ad-d090-2fe43bc9b6cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ricardo,

 First of all, I love this feature, so I would really like to see it applied.

 However, I'm thinking if there could be an alternative way to do it...

On 16/01/2019 23:45, Ricardo Martincoski wrote:

> +aarch64_efi_defconfig:
> +    <<: *defconfig
> +    only:
> +        - triggers
> +        - tags
> +        - /-defconfigs$/
> +        - /-aarch64_efi_defconfig$/

 Since we have a nice pattern with the branch name here, I think we could
instead rely on the branch name in the script and make a separate job for a
single defconfig. Something like this:

build-one-defconfig:
    only:
        - /_defconfig$/
    script:
        ... Use some sedded version of ${CI_BRANCH_NAME} ...

Of course, you'd want to refactor that with the existing defconfig_script so it
needs a little more work...


 Completely independent of this, it would also be nice if the .gitlab-ci could
be converted to use the "extends" keyword [1]. And also if the generated part
could be "include"d [2]. New gitlab features which weren't available when we
created this. With that in place, it might even be possible to do this in a
pipeline, where the included part is generated in the first stage - but I'm not
sure if gitlab-ci supports that.

 Regards,
 Arnout

[1] https://docs.gitlab.com/ee/ci/yaml/README.html#extends
[2] https://docs.gitlab.com/ee/ci/yaml/README.html#include
