From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 May 2017 17:36:38 +0000
Subject: [Buildroot] [Bug 9866] BASE_DIR usage
In-Reply-To: <bug-9866-163@https.bugs.busybox.net/>
References: <bug-9866-163@https.bugs.busybox.net/>
Message-ID: <bug-9866-163-N0HZ6ReKmw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9866

--- Comment #2 from Jean-pierre Cartal <jpcartal@free.fr> ---
Sorry, my explanation was not clear enough.
Let's try again ;-)

I have several build environments, some are using out-of-tree builds using the
-O option, others are using the default output location.

Now let's say I want to get the value of BR2_ARCH variable in the post image
shell script using the printvars target, I need to find the location of the
Makefile I should use.

My idea was to use the already available BASE_DIR variable as follow :
make -C ${BASE_DIR} printvars 

This is working fine for out-of-tree environments, since the
${BASE_DIR}/Makefile file will point to the makefile wrapper.
However for default build environment, ${BASE_DIR} will point to the output
directory where there is no Makefile available.

For the time being I added a test in my script as follow :
#Out-of-tree build case
if [ ${BASE_DIR}/Makefile ] ; then 
make -C ${BASE_DIR} printvars
# default build environment case.
else
make -C ${BASE_DIR}/../ printvars
fi;

So I had several questions :
1) Am I using the correct method to get the current build Makefile location ?
2) Wouldn't it be more consistent for ${BASE_DIR} to always point to a location
with the same content/structure for default and out-of-tree builds or maybe to
have another variable that would give access to current build Makefile location
?

Thanks for your help.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
