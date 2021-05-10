From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 May 2021 09:11:37 +0200
Subject: [Buildroot] [RFC] utils/test-pkg: add gitlab-ci support
In-Reply-To: <570453d7-61a6-41c1-315e-36d743a7cfa5@gmail.com>
References: <20210508164815.765195-1-romain.naour@gmail.com>
 <4c072a9e-b6c1-0fcc-ec8a-e170bb204c30@mind.be>
 <570453d7-61a6-41c1-315e-36d743a7cfa5@gmail.com>
Message-ID: <69ac9d6f-aaca-2e6a-0fde-602080a3a80b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/05/2021 00:00, Romain Naour wrote:
> Hi Arnout,
> 
> Le 09/05/2021 ? 13:38, Arnout Vandecappelle a ?crit?:
>>  Hi Romain,
>>
>> On 08/05/2021 18:48, Romain Naour wrote:
[snip]
>>> +.test_pkg:
>>> +    before_script:
>>> +        - TOOLCHAIN_NAME=${CI_JOB_NAME}
>>> +    script:
>>> +        - echo "Configure Buildroot for ${TOOLCHAIN_NAME}"
>>> +        - make O=br-test-pkg/${TOOLCHAIN_NAME} defconfig BR2_DEFCONFIG=br-test-pkg/${TOOLCHAIN_NAME}/defconfig
>>
>>  With my proposal, you wouldn't have this because br-test-pkg has already
>> created a partial .config file. Instead, you'd do a `make olddefconfig' here,
>> followed by 'make savedefconfig'.
> 
> How the br-test-pkg directory created from the job using generate-gitlab-ci-yml
> is provided to the child-pipeline's jobs ?
> 
> I guess we have to add generated .config files to artifacts.

 Indeed. Just make the entire br-test-pkg an artifact of the generate stage.


> Also, we have to skip .config file from invalid configuration (where the
> requested fragment is missing).
> Something similar to the first part of build_one() of test-pkg script.

 Argh, I didn't think of that! You can actually do this from the 'make'
invocation in gitlab-ci.yml, by doing an 'exit 0' in cast the toolchain
defconfig isn't found. But that's actually fairly complicated :-( Also, it makes
it more difficult to see which toolchains were skipped.

[snip]
>>> -    o='hakc:d:n:p:r:t:'
>>> -    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>>> +    o='hakgc:d:n:p:r:t:'
>>> +    O='help,all,keep,gitlab-ci,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>>
>>  With my proposal, we wouldn't add a gitlab-ci option, but only an option to
>> stop after generating the .config files. This option would obviously imply
>> --keep as well.
> 
> Actually if we can avoid generating files on the user's host it can be great :)
> Maybe call test-pkg from generate-gitlab-ci.yml script?

 Yeah, that might be a solution to the skipping problem. So we'd call test-pkg
twice: once in the generate-gitlab-ci.yml job to generate the .config files and
jobs, and a second time in each job to continue with the rest of the flow.

 You still can't easily see which toolchains are skipped, but I guess it's
better than nothing.

 Another possibility would be to run the 'make olddefconfig' step as well during
generate-gitlab-ci.yml, so that we only create the jobs for toolchains that are
not excluded. However, as you mentioned, that dramatically slows down the
generate-gitlab-ci.yml step, because it has to call 'make olddefconfig' a bunch
of times and that is notoriously slow... Still, this extra latency only happens
when you explicitly asked for the test-pkg invocation, so I guess it's acceptable.

 Regards,
 Arnout

> 
>>
>>  With my proposal, the rest of the changes to this script are no longer
>> relevant, so I haven't reviewed them.
> 
> Thanks for the review!
> 
> Best regards,
> Romain
> 
> 
>>
>>  Regards,
>>  Arnout
>>
>>
>> [snip]
>>
> 
