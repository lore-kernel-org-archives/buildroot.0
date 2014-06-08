From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 09:42:32 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <53938A1E.4060802@carallon.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53938A1E.4060802@carallon.com>
Message-ID: <20140608094232.741b6417@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Sat, 07 Jun 2014 22:54:38 +0100, Will Wagner wrote:

> > The implementation consists in adding a global instrumentation hook
> > that registers which files are installed by each package. A limitation
> > of the current implementation is that when a file is installed by a
> > package A and then overriden by package B, the mechanism will assume
> > the file was installed by package A. Suggestions to welcome on how to
> > solve this in a reasonably simple way.
> 
> Can you not record the timestamp the first time you see the file and see 
> if it has changed at the end. I appreciate a bash script to do this is 
> going to be pretty hard.

Depends on what you call "at the end". The problem is that between the
end of the install-target step of a given package, and the end of the
entire build of the system, most of the files in $(TARGET_DIR) are
modified due to stripping. Therefore, their timestamp changes.

The only thing I could think of would be based on SHA1: in the global
instrumentation hook, instead of just doing a "find" on all files in
$(TARGET_DIR) and then diff the result before/after the installation,
we include the SHA1. Therefore, the diff would indicate when a file has
changed, so we would be able to detect that. However, this would mean
that a file will be mentioned in two .filelist files, and since the
Python script has no idea in which order the packages were built, it
does not know which of the two packages won for the installation of the
given file. Could be based on the timestamp of the .filelist file,
though. Starts to be a bit tricky, as you can see :)

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
