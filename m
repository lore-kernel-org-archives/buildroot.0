From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 00:35:33 +1000
Subject: [Buildroot] Makefile.autotools.in stamp files
	breaks	multipleprojects
In-Reply-To: <1D28C7EE66C2440FB30AEE54DA90C54B@aeglos>
References: <20080904025034.GA18148@cloud.net.au>
	<1D28C7EE66C2440FB30AEE54DA90C54B@aeglos>
Message-ID: <20080904143533.GA28601@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 04, 2008 at 06:02:27AM +0200, Ulf Samuelsson wrote:
>> As previously discussed, Makefile.autotools.in creates stamp files in
>> $(BUILD_DIR)/$(PKG) such as .stamp_installed. This will prevent the
>> package being properly installed into multiple projects built out of the
>> same source tree. (The first project will build ok but subsequent
>> projects won't install the files.)
>>
>> I see a few solutions;
>>
>> 1. Each autotools-using package could (optionally?) specify the name of
>> a test target file to use, instead of using an explicit stamp file.
>> Hans-Christian sent a patch for this already.
>>
>
> That seems to be a good solution, except that if the build breaks after
> that file has been installed, other neccessary files might not be copied.
> You have to ensure that this is the last file that gets installed by the  
> package build.
> Even if this happens, then it could break if the package version gets  
> updated
> and the install order changes.

Yes it's a bit fragile. Most packages that don't use stamp files
probably just choose a random file, or the main binary - doing the same
for the autotools packages won't be any worse.

>> Obseleting (some or all of) the stamp files wouldn't be bad anyway. Many
>> of them could be replaced with actual targets, eg Makefile depends on
>> running configure (rather than using .stamp_configured).
>>
>> 2. The .stamp_install files could be put somewhere under $(TARGET_DIR)
>> instead of $(BUILD_DIR); they'd need to be stripped out by the various
>> generators in target/.. though.
>
> You can install the stamps in "project_build_<arch>/<project>/.stamps"
> as long as the make clean stuff cleans that up as well.
>
> Populating the target file system with stamps is not a good idea.

I'd prefer to use real files, but that will require us to update every
package that uses autotools in order to get the benefits. Using a stamp
file in project_build_$arch/$project/ somewhere is a good partial
solution though.

>> 3. Sharing $(BUILD_DIR) between multiple projects should be scrapped. In
>> practice, redefining BUILD_DIR = $(PROJECT_BUILD_DIR) would do it.
>
> Packages which can be configured by buildroot should remain in $(BUILD_DIR)
> while packages that can be configured should be in $(PROJECT_BUILD_DIR).
> Until this happens you should not have projects with different options or
> use a separate buildroot tree.
>
> You can have projects which have totally different set of packages.
>
>>
>> I think sharing $(BUILD_DIR) between multiple projects is quite broken.
>> The only benefit is that the packages only need to be compiled once.
>
> Which is a significant time saving, if you have to build multiple projects.

Negligible with modern hardware, IMHO. I've got about 6 projects built
in my working tree, all sharing the toolchain.. from scratch each of them 
would take under 10 minutes to build, and not long to do an incremental
build.

Longer if you're building X I suppose.

We'd be better off having separate build directories but trying to get
ccache to do its thing.

>> - different projects might be using different compilers or different
>>  compiler flags, and the right ones won't be used for each project.
>> - same for different kernel headers potentially.
>
> If you want different options for the toolchain, you need to use a 
> separate buildroot tree.

It'd be better if that was enforced in some way - right now you would
just get silent breakage.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
