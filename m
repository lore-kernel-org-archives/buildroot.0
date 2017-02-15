From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 00:17:16 +0100
Subject: [Buildroot] [PATCH v3] Add gitlab-CI support
In-Reply-To: <0cffe5e6-e9f0-7609-3365-d9418bde2783@cartelsol.com>
References: <20170213232303.7053-1-arnout@mind.be>
 <0cffe5e6-e9f0-7609-3365-d9418bde2783@cartelsol.com>
Message-ID: <a721ad85-3228-6e18-0980-fa70577f0e8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-02-17 00:53, Marcus Hoffmann wrote:
> Dear Arnout,
> 
> the typo is not quite fixed, I believe ;-).
> See below.
> 
> On 14.02.2017 00:23, Arnout Vandecappelle (Essensium/Mind) wrote:
>> The buildroot repository is now mirrored on
>> https://gitlab.com/buildroot.org/buildroot so we can use Gitlab-CI to
>> test Buildroot. Gitlab-CI is controlled by a .gitlab-ci.yml file
>> that exists in the repository.
>>
>> For now, the only test is building all defconfigs (inspired on
>> https://travis-ci.org/buildroot/buildroot-defconfig-testing/). Since
>> all the defconfigs have to be specified in the .gitlab-ci.yml file,
>> we generate the file based on .gitlab-ci.yml.in. The generated
>> .gitlab-ci.yml file has to be committed into the repository, though,
>> otherwise Gitlab-CI doesn't see it. So there is also a test to verify
>> that .gitlab-ci.yml is up-to-date.
>>
>> Building all the defconfigs takes a long time. Gitlab-CI will do that
>> every time it pulls from git.buildroot.org, which is once per hour.
>> That is way too often. Therefore, the defconfigs are not built on pull,
>> but only on explicit trigger through the API or when a tag is added.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> v3: - check-gitlab-ci.yml: make sure .gitlab-ci.yml doesn't exist, so it
>>       is really regenerated.
>>     - Factor defconfig_script in a separate anchor, for easy testing of
>>       a limited set of defconfigs.
>>     - fix typo (Marcus)
>>     - install packages with --no-install-recommends (Marcus)
>>     - explicitly add ca-certificates, rsync and file packages (Marcus)
>>
>> v2: Remove the custom before-script for check-gitlab-ci.yml.
>>     'make' is needed, so most of the rest of the before script is
>>     needed as well, so it's not so useful to avoid it.
>>
>> I pushed to my private buildroot clone on gitlab and triggered a build.
>> See https://gitlab.com/arnout/buildroot/pipelines/6435620

 I forgot to trigger a new build and post the new URL:
https://gitlab.com/arnout/buildroot/pipelines/6502273

>>
>> I think it would be useful to still apply this to master.
>> ---
>>  .gitlab-ci.yml    | 193 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  .gitlab-ci.yml.in |  52 +++++++++++++++
>>  Makefile          |   3 +
>>  3 files changed, 248 insertions(+)
>>  create mode 100644 .gitlab-ci.yml
>>  create mode 100644 .gitlab-ci.yml.in
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> new file mode 100644
>> index 0000000000..1e73867498
>> --- /dev/null
>> +++ b/.gitlab-ci.yml
>> @@ -0,0 +1,193 @@
>> +# Configuration for Gitlab-CI.
>> +# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>> +# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
>> +# It needs to be regenerated every time a defconfig is added, using
>> +# "make .gitlab-ci.yml".
>> +
>> +image: debian:stable
>> +
>> +before_script:
>> +    - dpkg --add-architecture i386
>> +    # The container has not package lists, so need to update first
> 
> Should be be 'no' instead of not here.

 D'oh. Can that be fixed up while committing?


 Regards,
 Arnout

> 
>> +    - apt-get update -qq
>> +    - apt-get install -y -qq --no-install-recommends
>> +        build-essential locales bc ca-certificates file rsync
>> +        git bzr cvs mercurial subversion libc6:i386 unzip wget cpio
>> +    # To be able to generate a toolchain with locales, enable one UTF-8 locale
>> +    - sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
>> +    - /usr/sbin/locale-gen
>> +
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
