From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Aug 2016 13:46:10 +0200
Subject: [Buildroot] Nearly duplicate builds
In-Reply-To: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
References: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
Message-ID: <da0b7f23-509b-82b0-26cf-3d30a9e2d264@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Kenneth,

 What you're asking is unfortunately not simple...

On 27-08-16 09:28, Kenneth Adam Miller wrote:
> So, we have multiple boards and multiple users. The way that buildroot
> functions is such that, for nearly duplicate builds, the only thing
> you can really do to eliminate redundant builds is to move the
> toolchain to be external. In my case, it kind of makes sense to have
> have as much as possible of the build to not be repeated
> unnecessarily. We have an entire team working with buildroot, and
> doing so much repeated work is a strain on both time and computer
> resources. We have to have a huge machine in order to make so many
> builds, for both integration testing and local development for each
> user and board, more palatable.

 One thing that may help to speed up builds is to enable BR2_CCACHE and use a
shared ccache directory. That typically moves the bottleneck to the configure
scripts (which can't make use of ccache and are not parallelized). It does allow
you to run several builds in parallel on the same machine, because the load is a
lot lower.

 Another possibility is to build parts "externally". First of all, build a
toolchain that you use as an external toolchain. Then the kernel and bootloader
can also be built separately, published to a well-known location, and retrieved
from there in the post-image script.

 You can do something similar for application development. Typically while
developing an application, you don't actually change anything in the rest of the
rootfs, so you can just build your application independently using the external
toolchain. You can then pick up a pre-built rootfs tarball from a well-known
location, add the just-built stuff to it, and run the image generation script.
It does mean that you don't use buildroot anymore for the image generation
itself, but there is anyway not so much that buildroot adds there. And you can
write the script in a way that it can be used either as a post-image script or
externally. Any host tools that are needed by this script can be included in the
external toolchain.


> My question is, would there be a way to reduce unnecessary repeated
> work between packages and configurations? In our case, often
> configurations are very nearly duplicate, but differ in just a few
> userland packages and very little configuration information for the
> kernel.
> 
> My thinking for how such a package or modification to buildroot would
> work is that it would transparently facilitate managing a soft link
> forest between the common build directory and the build directory
> designated as the output directory for each particular target. In this
> way, a convention would be adopted in specifying a user though the
> tool with a simple $USER environment variable in navigating to a
> user's build directory before executing the build. The user themselves
> would be responsible for maintaining the list of packages that differ
> from a shared default in both white and black listing from common
> build. In this way, buildroot would just keep all the common packages
> between users and boards built as it normally does, and then do
> individual work for what is different per specific configuration.

 I think what you're basically after is a per-package build artefact cache.
There are a few problems with this at the moment.

1. HOST_DIR and STAGING_DIR contain references to the absolute path of where it
was built, so it's different for different users. HOST_DIR is also not
relocatable at the moment, so it has to stay at the location where it used to
reside - but your symlink tree can work around that.

2. The build results are different depending on which other packages exist. E.g.
httping will link with openssl if it was selected, so you'd need to have two
versions of httping. To make matters worse, not all of these dependencies are
explicitly recorded in buildroot (which is a bug, but bugs exist :-).

3. There is nothing at the moment that helps you to make differences between
configs, and I think it could be pretty difficult in general (e.g. how to deal
with virtual packages?)


For 1, Samuel is working on a "relocatable toolchain" series that is currently
in its 9th iteration. Reviews would help :-)

For 2, there was a "per-package staging" series by Fabio. The last iteration was
June last year and there still was a lot of work. This would also enable
top-level parallel builds, which offer a significant speedup, and rebuilding
after removing TARGET_DIR.

For 3, nothing exist at the moment AFAIK.

> 
> The thing about this though, is that this functionality isn't present
> to my knowledge, and even if it was, it wouldn't fully answer the
> problem I don't believe. Overlays help with this a bit as well, but
> that I know of they also aren't going to solve all the problems of
> multiple configuration per project. 

 If it is just about adding/removing packages, an option would be to make one
super-config that contains everything and run that continuously on your build
server, and let each individual project/configuration remove the things that
they don't need from this tarball, combine it with an externally built kernel
and bootloader, and run a post-image script. In other words, you'd use buildroot
only to create the super-config.


> I could be wrong about each of
> those presumptions in regards to my needs, so if I am, someone please
> explain it to me. I do think the ability to have a generated overlay
> per buildroot package would be pretty cool. For us, the final image
> creation cost being separate from the actual build cost would be
> fantastic in being able to clean our builds per package (not currently
> a feature), and also be great since the individual overlays themselves
> could be soft linked. and thereby versioned.
> 
> Does anybody know of such a configuration differencing and versioning
> tool? Would there be a way to use buildroot's features to calculate
> the package differences between two defconfigs, and thereby make an
> action with respect to overlay or build isolation with them per user
> command?

 I actually think that that aspect is much less important. If you can use cached
staging and target trees for packages, it isn't necessary to calculate the
differences between configs: you just take the results from the cache if
available, and build them if not available.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
