From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 11:37:26 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B2181AA3EE@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>
 <5DBA847110A28B46BBA17BE675F0C9B2181AA3EE@cnshjmbx01>
Message-ID: <18b38324-822a-115c-beaa-c2c36fc5898c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-11-17 05:32, Chu, Zhuliang (NSB - CN/Shanghai) wrote:
> Hello Thomas Petazzoni, All,
> 
>> Hello,
>>
>> On Tue, 7 Nov 2017 11:48:17 +0000, Chu, Zhuliang (NSB - CN/Shanghai)
>> wrote:
[snip]
>>> in mainstream buildroot, the order of package A is before openssl. So openssl is always support A.
>>> but in 'ppsh', openssl is always not support A. if once 'ppsh' is merged into the mainstream, there will cause software inconsistencies.
>>
>> I don't understand this problem. Which "package A" are you referring to ?
>> Could you describe in more details the problem you're seeing?
> 
> Sorry my introduction is too simple to cause ambiguity in my first email.
> This issue is only my worries but don`t be verified in my test.
> 
> My worries:
> When I am a customer, I always use current buildroot. 
> In current buildroot, the build order guarantee is very import and the order is determined after many times of testing by customer.

 No, we don't guarantee the build order, it just happens to work that way.

> Example package 'A', it is not explicitly expressed in openssl`s .mk file. But in current build order, 'A' is before openssl. So in the configuring step of openssl,the openssl will check that 'A' has been installed. So I am sure that the final result is the openssl support 'A'.
> If per-package gets to the point where it can be merged and it will be pushed into buildroot mainstream. In customers, they will find the buildroot can be parallel compilation now. They will be very happy to use this feature. So they will use `make -j8` instead of 'make -j1'. If they don`t explicitly describe the dependency 'A' in openssl`s .mk file. And now the openssl don`t support 'A'. But this is not expected behavior for customer.

 If a dependency is not tracked in the .mk file, you can't count on it. Now
already it is possible that the order changes due to other dependencies (e.g.
package C gets an optional dependency on openssl in the new Buildroot version,
and package C comes alphabetically before package A, then the new Buildroot
version will build openssl before package A instead of after.

[snip]
> Q1: rsync conflicts
> I want to generate this conflicts in testing but this is difficult. So this is also only my worries.
> At the same time in parallel compilation, different threads want to modify the same file of a package in different per-package/package directory and modify the content isn`t the same.
> This will generate conflicts. How to solve this problem?
> I.E. thread t1 modify file A in per-package/package/A, t1 want to modify A content from 'TEXT' to 'EXIT'. At the same time, thread t2 also modify A content from 'TEXT' to 'TXXT'.

 Yes, this is a problem and potential showstopper. We discussed it at length at
the last BR developer meeting [1]. The conclusion is that we simply cannot
support packages that edit existing files in top-level parallel build context -
they would have to encode their dependencies explicitly to force a specific
build order. To detect how bad the problem is for in-tree packages, Yann posted
a series [2] that allows to detect it. The idea is that we will turn that
detection into an error when PPS is merged.


> And I think rsync has enough power to handle such parallel changes in this situation. but after the successful modify there is still problem. for example, rsync make the content as 'TXXT' and this result is suitable thread t2. But the thread t1 wants to 'EXIT'. 

 Actually, I checked, and rsync has no protection at all against parallel
execution. E.g. it will first test if a directory exists already and then create
it; if another rsync is at the same time creating that directory, one of the
directory creations will fail. So all the rsync's into the same (per-package)
directory have to be serialised.

> I know this probability is minimal. But what should we do if such a conflict arises?

 As I said: error out.


> Q2: toolchain HOST_DIR
> I use  external custom toolchain. 'BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y'
> line 66 of pkg-toolchain-external.mk66 in toolchain/toolchain-external/ is 'TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain '.
> this $(HOST_DIR) is also 'output/host/' rather than 'output/per-package/....'. 

 Do you have an actual example of that? The toolchain is just a package, so in
all places where this variable is used, HOST_DIR should expand into
output/per-package/.... The except is the definition of TOOLCHAIN_EXTERNAL_BIN,
but that was fixed in patch 3/4.


 So, for your further testing, can you try without CCACHE and without patches
that attempt to fix it? Thanks to your testing we found out that ccache is
problematic, and it will take a bit of time to fix that. As you have noticed,
fixing it correctly is not trivial :-)


 Regards,
 Arnout


[1] https://elinux.org/Buildroot:DeveloperDaysELCE2017#Top-level_parallel_build
[2] http://patchwork.ozlabs.org/project/buildroot/list/?series=10725

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
