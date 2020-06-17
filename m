From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jun 2020 18:13:26 +0000
Subject: [Buildroot] [Bug 13001] openjdk-bin replaces libfreetype.so from
 host-freetype
In-Reply-To: <bug-13001-163@https.bugs.busybox.net/>
References: <bug-13001-163@https.bugs.busybox.net/>
Message-ID: <bug-13001-163-lZvVu7yFaQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

--- Comment #6 from Adam Duskett <aduskett@gmail.com> ---
Sorry for the delayed response, as this ticket is mine.

I would propose doing what we did with OpenJDK, which is installing
host-openjdk-bin to /usr/lib/jvm. This directory structure provides two
advantages:

1) The directory structure is consistent with how we handle the target OpenJDK.
2) I have been spending some time with OpenJDK and Buildroot as of late. Part
of what I have had to do was set up Maven with Buildroot, and in doing so I
found that the host-openjdk-bin install step does not copy the conf file from
the source directory to the host directory.

This lack of copying causes Maven to crash with the error "Can't read
cryptographic policy directory: unlimited."

After some research, I found that Maven looks for conf files in
$(JAVA_HOME)/conf, which Buildroot does not provide.

Maven also searched for $(JAVA_HOME)/bin and $(JAVA_HOME)/lib which do exist.

So there are two options to fix this issue:

Copy the conf directory to $(HOST_DIR), which would result in a
$(HOST_DIR)/conf directory.

OR

Follow the standard practice of installing the entire JVM to /usr/lib/jvm


I would propose the second option as it also looks nicer and allows us not to
have a $(HOST_DIR)/conf directory.


Yann, thoughts?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
