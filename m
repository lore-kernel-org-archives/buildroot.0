From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 27 Aug 2016 03:28:04 -0400
Subject: [Buildroot] Nearly duplicate builds
Message-ID: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, we have multiple boards and multiple users. The way that buildroot
functions is such that, for nearly duplicate builds, the only thing
you can really do to eliminate redundant builds is to move the
toolchain to be external. In my case, it kind of makes sense to have
have as much as possible of the build to not be repeated
unnecessarily. We have an entire team working with buildroot, and
doing so much repeated work is a strain on both time and computer
resources. We have to have a huge machine in order to make so many
builds, for both integration testing and local development for each
user and board, more palatable.

My question is, would there be a way to reduce unnecessary repeated
work between packages and configurations? In our case, often
configurations are very nearly duplicate, but differ in just a few
userland packages and very little configuration information for the
kernel.

My thinking for how such a package or modification to buildroot would
work is that it would transparently facilitate managing a soft link
forest between the common build directory and the build directory
designated as the output directory for each particular target. In this
way, a convention would be adopted in specifying a user though the
tool with a simple $USER environment variable in navigating to a
user's build directory before executing the build. The user themselves
would be responsible for maintaining the list of packages that differ
from a shared default in both white and black listing from common
build. In this way, buildroot would just keep all the common packages
between users and boards built as it normally does, and then do
individual work for what is different per specific configuration.

The thing about this though, is that this functionality isn't present
to my knowledge, and even if it was, it wouldn't fully answer the
problem I don't believe. Overlays help with this a bit as well, but
that I know of they also aren't going to solve all the problems of
multiple configuration per project. I could be wrong about each of
those presumptions in regards to my needs, so if I am, someone please
explain it to me. I do think the ability to have a generated overlay
per buildroot package would be pretty cool. For us, the final image
creation cost being separate from the actual build cost would be
fantastic in being able to clean our builds per package (not currently
a feature), and also be great since the individual overlays themselves
could be soft linked. and thereby versioned.

Does anybody know of such a configuration differencing and versioning
tool? Would there be a way to use buildroot's features to calculate
the package differences between two defconfigs, and thereby make an
action with respect to overlay or build isolation with them per user
command?
