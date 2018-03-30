From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 30 Mar 2018 22:33:49 +0200
Subject: [Buildroot] [PATCH v4 03/11] package/llvm: enable AMDGPU
In-Reply-To: <20180330210641.334407b0@windsurf>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-4-valentin.korenblit@smile.fr>
 <20180330110241.792a6607@windsurf>
 <b5a9d228-d7e1-7330-b5f6-52ad7ea443b9@mind.be>
 <20180330210641.334407b0@windsurf>
Message-ID: <18c4a3ac-db52-5542-e8c6-fc17e3e5251c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 30/03/2018 21:06, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 30 Mar 2018 20:08:28 +0200, Arnout Vandecappelle wrote:
>
>>   Or maybe
>>
>> LLVM_TARGETS_TO_BUILD = $(HOST_LLVM_TARGET_ARCH)
>>
>> ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
>> LLVM_TARGETS_TO_BUILD += AMDGPU
>> endif
>>
>> LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD=$(subst
>> $(space),;,$(LLVM_TARGETS_TO_BUILD))
>>
>>
>>   Or is that too much GNUmake black magic?

I've just tested your suggestions, but finally we also need to build amdgpu target for host. The reason is that
llvm-config (host version installed in STAGING) will output only x86 when executing llvm-config --targets-built.
This is because it stores information related to the build where it comes from.

This fails when Mesa looks for amdgpu backend:

llvm_add_target() {
     new_llvm_target=$1
     driver_name=$2

     if $LLVM_CONFIG --targets-built | grep -iqw $new_llvm_target ; then
         llvm_add_component $new_llvm_target $driver_name
     else
         AC_MSG_ERROR([LLVM target '$new_llvm_target' not enabled in your LLVM build. Required by $driver_name.])
     fi
}

> No, that's good.
>
> Thomas

Best regards,

Valentin
