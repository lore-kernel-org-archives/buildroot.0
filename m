From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 9 Aug 2018 10:14:04 -0700
Subject: [Buildroot] [PATCH] docs/manual: gcc 4.4 is the lowest we are
 known to work with
In-Reply-To: <CANQCQpZv0zcAV4L_ZdRk21e22GLw5pzaTe_2JoH0kN_uC4Tumw@mail.gmail.com>
References: <20180805114615.3442-1-yann.morin.1998@free.fr>
 <CANQCQpZv0zcAV4L_ZdRk21e22GLw5pzaTe_2JoH0kN_uC4Tumw@mail.gmail.com>
Message-ID: <e985bd73-96e5-a955-70fd-dfd532032a77@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2018 06:08 AM, Matthew Weber wrote:
>
> Any suggestions if we keep the minimum host compiler requirement at
> 4.4, how should I address the below build failures with "error:
> '__ATOMIC_ACQUIRE' undeclared " on the RHEL6.5 autobuilder?
> http://autobuild.buildroot.net/?reason=host-libselinux-2.7
>
> If this was a more recent compiler version issue, I'd dig into the
> package and look at up-streaming a compatibility ifdef check.
I'm not an expert in this area, but I'm surprised atomic operations are 
needed in addition to the pthread_mutex_lock. See these comments, for 
example: 
https://stackoverflow.com/questions/24137964/does-pthread-mutex-lock-contains-memory-fence-instruction 
. AFAIK, these atomic operations could be replaced with their native 
equivalents.

That said, I'm not using SELinux, and even if I were I wouldn't care too 
much about the host binaries, so I'm not interested in a lengthy email 
debate about compiler optimizations, processor pipelines, atomic 
operations, and memory barriers. :-) If we're not comfortable with 
removing them altogether, then I think we could use the older "__sync" 
builtins 
<https://gcc.gnu.org/onlinedocs/gcc-4.4.7/gcc/Atomic-Builtins.html> 
instead. Going for correctness instead of performance:

--- output/build/host-libselinux-2.7/src/label_file.h.orig      2018-08-09 09:47:46.432960085 -0700
+++ output/build/host-libselinux-2.7/src/label_file.h   2018-08-09 09:50:47.036960057 -0700
@@ -349,8 +349,14 @@
          * init_routine does not take a parameter, it's not possible
          * to use, so we generate the same effect with atomics and a
          * mutex */
+#ifdef __ATOMIC_ACQUIRE
         regex_compiled =
                 __atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
+#else
+       /* GCC <4.7 */
+       __sync_synchronize();
+       regex_compiled = spec->regex_compiled;
+#endif
         if (regex_compiled) {
                 return 0; /* already done */
         }
@@ -358,8 +364,14 @@
         __pthread_mutex_lock(&spec->regex_lock);
         /* Check if another thread compiled the regex while we waited
          * on the mutex */
+#ifdef __ATOMIC_ACQUIRE
         regex_compiled =
                 __atomic_load_n(&spec->regex_compiled, __ATOMIC_ACQUIRE);
+#else
+       /* GCC <4.7 */
+       __sync_synchronize();
+       regex_compiled = spec->regex_compiled;
+#endif
         if (regex_compiled) {
                 __pthread_mutex_unlock(&spec->regex_lock);
                 return 0;
@@ -402,7 +414,13 @@
         }
  
         /* Done. */
+#ifdef __ATOMIC_RELEASE
         __atomic_store_n(&spec->regex_compiled, true, __ATOMIC_RELEASE);
+#else
+       /* GCC <4.7 */
+       spec->regex_compiled = true;
+       __sync_synchronize();
+#endif
         __pthread_mutex_unlock(&spec->regex_lock);
         return 0;
  }

If there's general agreement with this approach, I can submit it as a 
Buildroot patch.

Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180809/f849b621/attachment.html>
