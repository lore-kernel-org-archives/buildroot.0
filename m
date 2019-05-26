From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 22:15:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix debug build on
 uclibc/musl
In-Reply-To: <20190526214536.479b9db9@windsurf>
References: <20190526191814.3942-1-fontaine.fabrice@gmail.com>
 <20190526214536.479b9db9@windsurf>
Message-ID: <94de6d4a-ba94-3f12-7692-44f942fde97e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/05/2019 21:45, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout in Cc.
> 
> On Sun, 26 May 2019 21:18:14 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Always set CMAKE_BUILD_TYPE to Release otherwise supertux will be built
>> with -pg since:
>> https://github.com/SuperTux/supertux/commit/afd5f1b33c110104a7f286d6d7854157919a0a52
>>
>> This will result in the following build failure on uclibc or musl:
>> [ 77%] Linking C executable sq_static
>> CMakeFiles/sq_static.dir/sq.c.o: In function `quit':
>> /home/buildroot/autobuild/instance-3/output/build/supertux-0.6.0/external/squirrel/sq/sq.c:42: undefined reference to `__gnu_mcount_nc'
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/b0b2e25af198d01713d1e2bcf38c77ae8ffbd7de
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> So, it really seems like we want to stop using -DCMAKE_BUILD_TYPE=Debug
> when BR2_ENABLE_DEBUG=y, like Arnout suggested in another thread.

 I guess that means you agree with my analysis then? :-)

 Note, however, that the current patch can go to master, while the change of
build type is definitely *not* for master...

 [Or maybe I misread your statement, I thought you meant that Fabrice should
drop this patch and instead globally set build type to Release.]

 Regards,
 Arnout

> Packages are adding random flags when -DCMAKE_BUILD_TYPE=Debug, it is
> not really usable, as BR2_ENABLE_DEBUG should only mean "add -g to
> CFLAGS".
> 
> Thomas
> 
