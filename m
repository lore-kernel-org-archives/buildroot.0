From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Sep 2015 16:48:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20150903164828.C12F681EE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #13 from Alex Potapenko <opotapenko@gmail.com> 2015-09-03 16:48:28 UTC ---
I have encountered the same issue with Buildroot-2015-08. After some
investigation, I found out that
BR2_PTHREADS_NATIVE=y
Switches on
UCLIBC_HAS_THREADS_NATIVE=y
uclibc config, which automatically triggers
UCLIBC_HAS_TLS=y

So, if gcc is built without tls, this leads to the error from this ticket.
After switching threads to something different uclibc builds fine without tls
in gcc. I think, these two options (BR2_PTHREADS_NATIVE and BR2_GCC_ENABLE_TLS)
should be connected, since tls has to either be enabled in both gcc and uclibc,
or likewise disabled in both.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
