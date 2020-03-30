From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 30 Mar 2020 07:46:38 -0500
Subject: [Buildroot] RFC: make pkg-docs
Message-ID: <CANQCQpY41qCvbX+PQr0oJrY82tax_D7nxtwdAMzVZNvpMvYsfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I thought I'd pass on an idea a teammate had that seemed like the next
evolution of what Buildroot is already doing with make legal-info.

The idea is to add a new make target that collects up all the package
docs in whatever form they are presented and then organize them in a
folder set similar to legal-info by package name.  This hook doesn't
attempt to build them or do anything beyond organize the set of
material for release with possibly the SDK or a post-build activity
that hooks in to render that content as part of a larger report
outside of the Buildroot build.

Beyond all the Buildroot packages, in a br2-external use case this
becomes handy as a way to present a folder of material for inclusion
into larger documentation renderings.

The most basic option would be to just list out what we'd want copied.
The only negative thing is that this requires a bunch of manual work
to setup all the file lists.

LIBFOO_DOC_FILES = doc/foobar.asciidoc release_notes.txt

Another option would be to instead look for a {doc, docs} folder in
the base of the package's source direct and ignore an initial list of
files based on extension (*.am, *.in, Makefile, CMAKE)  (I probably
should look if Yocto already does something similar and has a list).
Additionally this option could need an optional blacklist method in
the package's .mk.  So for a package like libxml2, it could look like
just removing a random python script.  However the need for this
blacklist option is probably optional and based on how clean the
output might need to be in the destination folder for other uses.

LIBXML2_DOC_FILES_BLACKLIST = doc/apibuild.py

If doing the automated option that looks for a  {doc, docs} folder, it
would probably make sense to also include a option to manually include
additional files outside of that assumed path.  Then things like
release notes and other files elsewhere in the folder structure can be
included.

LIBXML2_DOC_FILES += ChangeLog

Thoughts?  Anyone else have a use case where this would be beneficial to have?

Matt
