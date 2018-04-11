From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Apr 2018 18:12:31 +0200
Subject: [Buildroot] [PATCH] package/llvm: remove $ORIGIN/../lib from
 RPATH
In-Reply-To: <20180411174933.490f56ad@windsurf>
References: <20180411153022.13335-1-valentin.korenblit@smile.fr>
 <20180411174933.490f56ad@windsurf>
Message-ID: <a9be8bfb-ac35-9d42-7c93-3d9431555b89@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 11/04/2018 17:49, Thomas Petazzoni wrote:
> Hello Valentin,
>
> On Wed, 11 Apr 2018 17:30:22 +0200, Valentin Korenblit wrote:
>> AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.
>> This causes a problem when llvm-config from host installed in
>> STAGING_DIR is executed under the following conditions:
>>
>> *Target architecture same as host architecture (normally x86_64)
>> *Target's libc different from host's libc (normally glibc)
>>
>> llvm-config will try to link with the target's libc, resulting in:
>>
>> ./llvm-config: error while loading shared libraries: libc.so.0:
>> cannot open shared object file: No such file or directory.
>>
>> Link to autobuild error:
>> http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/
>>
>> To avoid this, remove the code from llvm_setup_rpath in AddLLVM.cmake
>>
>> Link to discussion:
>> http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html
>>
>> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Thanks for this work. However, while this is going to work for the
> Buildroot build (thanks to the hardcoded absolute RPATH encoded into
> the binaries), I believe it will fail once "make sdk" is executed,
> because "make sdk" will change the RPATH of binaries in STAGING_DIR to
> be relative RPATHs.
>
> Could you try after applying your patch:
>
> $ make [.... do the normal build ...]
> $ ./output/staging/usr/bin/llvm-config --the-flags-that-are-important
> $ readelf -d output/staging/usr/bin/llvm-config
> $ make sdk
> $ ./output/staging/usr/bin/llvm-config --the-flags-that-are-important
> $ readelf -d output/staging/usr/bin/llvm-config
>
> Is there any difference before/after the "make sdk" ?

Before running make sdk:

(RPATH) Library rpath: [/home/vakor/buildroot/test/x86/host/lib]

After running make sdk:

(RUNPATH) Library runpath: []

llvm-config works correctly in both cases. I tarballed host, moved
it to a different location, extracted it and run relocate-sdk.sh.

>
> Best regards,
>
> Thomas

Best regards,

Valentin
