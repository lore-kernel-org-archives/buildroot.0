From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Mon, 13 Feb 2017 13:18:28 +0100
Subject: [Buildroot] [PATCH v2] Add gitlab-CI support
In-Reply-To: <20170212212715.29524-1-arnout@mind.be>
References: <20170207145550.11009-1-arnout@mind.be>
 <20170212212715.29524-1-arnout@mind.be>
Message-ID: <707812a9-c5d0-15c6-85f1-bf3a64782a21@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

I did something similar for our buildroot project. See my comments below.

On 12.02.2017 22:27, Arnout Vandecappelle (Essensium/Mind) wrote:
> The buildroot repository is now mirrored on
> https://gitlab.com/buildroot.org/buildroot so we can use Gitlab-CI to
> test Buildroot. Gitlab-CI is controlled by a .gitlab-ci.yml file
> that exists in the repository.
> 
> For now, the only test is building all defconfigs (inspired on
> https://travis-ci.org/buildroot/buildroot-defconfig-testing/). Since
> all the defconfigs have to be specified in the .gitlab-ci.yml file,
> we generate the file based on .gitlab-ci.yml.in. The generated
> .gitlab-ci.yml file has to be committed into the repository, though,
> otherwise Gitlab-CI doesn't see it. So there is also a test to verify
> that .gitlab-ci.yml is up-to-date.
> 
> Building all the defconfigs takes a long time. Gitlab-CI will do that
> every time it pulls from git.buildroot.org, which is once per hour.
> That is way too often. Therefore, the defconfigs are not built on pull,
> but only on explicit trigger through the API or when a tag is added.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: Remove the custom before-script for check-gitlab-ci.yml.
>     'make' is needed, so most of the rest of the before script is
>     needed as well, so it's not so useful to avoid it.
> 
> I pushed to my private buildroot clone on gitlab and triggered a build.
> See https://gitlab.com/arnout/buildroot/pipelines/6435620
> 
> I think it would be useful to still apply this to master.
> ---
>  .gitlab-ci.yml    | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml.in |  48 ++++++++++++++
>  Makefile          |   3 +
>  3 files changed, 240 insertions(+)
>  create mode 100644 .gitlab-ci.yml
>  create mode 100644 .gitlab-ci.yml.in
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> new file mode 100644
> index 0000000000..f7fa5a0972
> --- /dev/null
> +++ b/.gitlab-ci.yml
> @@ -0,0 +1,189 @@
> +# Configuration for Gitlab-CI.
> +# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> +# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
> +# It needs to be regenerated every time a defconfig is added, using
> +# "make .gitlab-ci.yml".
> +
> +image: debian:stable
> +
> +before_script:
> +    - dpkg --add-architecture i386
> +    # The container has not packe lists, so need to update first

There is a typo here. Probably you meant "no package lists".

> +    - apt-get update -qq
> +    - apt-get install -y -qq build-essential locales git bzr cvs mercurial subversion libc6:i386 unzip bc wget cpio

You might want to explicitly add the ca-certificates and file  packages
here. They are implicitly installed as recommends of some of the version
control systems, but are not preinstalled or part of build-essential.

Also maybe you want to add --no-install-recommends to keep down the
install time. Then maybe a few more packages need to be added (i.e. rsync)

> +    # To be able to generate a toolchain with locales, enable one UTF-8 locale
> +    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
> +    - /usr/sbin/locale-gen
> +
> +check-gitlab-ci.yml:
> +    script:
> +        - cp .gitlab-ci.yml .gitlab-ci.yml.orig
> +        - make .gitlab-ci.yml
> +        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
> +
> +.defconfig: &defconfig
> +    # Running the defconfigs for every push is too much, so limit to
> +    # explicit triggers through the API.
> +    only:
> +        - triggers
> +        - tags
> +    script:
> +        - echo 'Configure Buildroot'
> +        - make ${CI_BUILD_NAME}
> +        - echo 'Build buildroot'
> +        - |
> +            make > >(tee build.log |grep '>>>') 2>&1 || {
> +                echo 'Failed build last output'
> +                tail -200 build.log
> +                exit 1
> +            }
> +    artifacts:
> +        when: always
> +        expire_in: 2 weeks
> +        paths:
> +            - build.log
> +            - output/images/
> +            - output/build/build-time.log
> +            - output/build/packages-file-list.txt
> +
> [...]
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> new file mode 100644
> index 0000000000..a8e91c1ca4
> --- /dev/null
> +++ b/.gitlab-ci.yml.in
> @@ -0,0 +1,48 @@
> +# Configuration for Gitlab-CI.
> +# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> +# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
> +# It needs to be regenerated every time a defconfig is added, using
> +# "make .gitlab-ci.yml".
> +
> +image: debian:stable
> +
> +before_script:
> +    - dpkg --add-architecture i386
> +    # The container has not packe lists, so need to update first
> +    - apt-get update -qq
> +    - apt-get install -y -qq build-essential locales git bzr cvs mercurial subversion libc6:i386 unzip bc wget cpio
> +    # To be able to generate a toolchain with locales, enable one UTF-8 locale
> +    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
> +    - /usr/sbin/locale-gen
> +
> +check-gitlab-ci.yml:
> +    script:
> +        - cp .gitlab-ci.yml .gitlab-ci.yml.orig
> +        - make .gitlab-ci.yml
> +        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
> +
> +.defconfig: &defconfig
> +    # Running the defconfigs for every push is too much, so limit to
> +    # explicit triggers through the API.
> +    only:
> +        - triggers
> +        - tags
> +    script:
> +        - echo 'Configure Buildroot'
> +        - make ${CI_BUILD_NAME}
> +        - echo 'Build buildroot'
> +        - |
> +            make > >(tee build.log |grep '>>>') 2>&1 || {
> +                echo 'Failed build last output'
> +                tail -200 build.log
> +                exit 1
> +            }

I wondered why you used process substitution here, instead of something
like this (Which I find easier to understand, but that might just be me.):

make 2>&1 | tee build.log | grep '>>>' || {echo [...]}

But then we'd have to set -o pipefail, is that the reason for not using
a pipeline, or am I missing something else?


> +    artifacts:
> +        when: always
> +        expire_in: 2 weeks
> +        paths:
> +            - build.log
> +            - output/images/
> +            - output/build/build-time.log
> +            - output/build/packages-file-list.txt
> +
> diff --git a/Makefile b/Makefile
> index dcda8fe024..bf653a587c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1066,6 +1066,9 @@ release:
>  print-version:
>  	@echo $(BR2_VERSION_FULL)
>  
> +.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
> +	(cd configs; ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
> +
>  include docs/manual/manual.mk
>  -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
>  
> 

Best regards,
Marcus
