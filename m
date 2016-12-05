From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 18:39:26 +0100
Subject: [Buildroot] distributable Buildroot BSPs/SDKs
In-Reply-To: <4d2a06e9-d9a8-ff6b-ffa6-1b2b58dadb0b@mentor.com>
References: <55a57fe4-1542-6b61-64ce-4ed10dd7d005@mentor.com>
 <d7467804-2f2f-d5a4-404c-113e4f788133@mentor.com>
 <7a64a70c-f8ff-f15d-e7b0-c1c226df96bd@mind.be>
 <4d2a06e9-d9a8-ff6b-ffa6-1b2b58dadb0b@mentor.com>
Message-ID: <5d193233-2881-653a-6af6-a0028a45a4d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-11-16 18:02, Hollis Blanchard wrote:
> On 11/04/2016 03:17 PM, Arnout Vandecappelle wrote:
[snip]
>>  What I do is basically two configs:
[snip]
>>  You have to maintain both defconfigs and you have to provide both to the users
>> (though they'll normally only use the second one).
> 
> OK, two defconfigs isn't a problem.
> 
> 
> Non-relocatable is a problem though. Many (most?) of our users don't have root
> permission to the shared lab systems they're using, so must install into unusual
> directories.

 The main problem is in shared libraries. gcc is linked statically with gmp, mpc
and mpfr so is no problem (though I'm not so sure if cloog is also linked
statically). Other tools however may link dynamically with host libraries. RPATH
is set in them, but with an absolute path so not relocatable. There is a patch
series to rewrite all host executables to use $ORIGIN in rpath so it can be
moved around, but those patches still need rework.

 In addition, there may be other programs that refer to absolute paths in the
host directory. Each will have to be handled individually to make them relocatable.

> 
>>>>  2. I really only want to distribute a couple key host binaries, like adb and
>>>>     dtc. However, since these depend on other host packages,
>>>>     output/host/usr/bin ends up full of other binaries from gettext,
>>>>     autoconf/automake/etc, flex, etc. That's dead weight as far as I'm
>>>>     concerned; it takes up space, and encourages people to actually use them,
>>>>     but I don't want to support them.
>>  That's tough, because the host tools that you do use may inadvertently call
>> some of these binaries... E.g. if gdb is built with python support, then it will
>> call the host-python executable only when a plugin is running a python script...
> 
> That means the building user needs to know the details of each tool they build,
> to know what its real runtime dependencies will be. Of course, in an ideal
> world, the word "user" in that statement would be replaced by the word "recipe",
> which is a more appropriate location for that knowledge. :-)

 Actually, that information is already available in the DEPENDENCIES of the
package. You can get it externally with 'make printvars | grep
HOST_FOO_DEPENDENCIES'. The next problem is finding out which files belong to
that package...

 Gustavo is working a "per package staging" (which will actually be "per package
host directory" in the end). That will allow you to get the exact tarball of the
host directory containing everything that is needed to build a specific (host)
package. But I'm afraid development on that feature has been stalled.


>>      3. Host tools are built with options like these:
>>         --sysconfdir=/absolute/path/to/output/host/etc (so they can find
>>         output/host/etc/mke2fs.conf, for example). Huh. Readelf won't help me
>>         find those dependencies, and no rpath will help me relocate that. I'm
>>         not even sure what directory structure I would want for those files in
>>         an ideal BSP.
> 
> It looks like Poky (OpenEmbedded?) recipes install wrapper shell scripts into
> the host directory, as seen in create_wrapper()
> <https://github.com/kraj/poky/blob/master/meta/classes/utils.bbclass#L275>. Then
> a relocation script can edit the wrappers. In the case of mke2fs, I guess that
> wrapper might look like this:
> 
>     #!/bin/bash
>     realpath=`readlink -fn $0`
>     export MKE2FS_CONFIG=@SDK_BASE_DIRECTORY@/etc/mk
>     exec -a `dirname $realpath`/$cmdname `dirname $realpath`/$cmdname.real "$@"

 Yes, and this kind of thing has to be done for each package.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
