From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jan 2016 09:30:57 +0100
Subject: [Buildroot] Information on X front end
In-Reply-To: <023701d159c7$1c5806f0$550814d0$@signel.ca>
References: <023701d159c7$1c5806f0$550814d0$@signel.ca>
Message-ID: <20160129093057.3a21dedf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marc,

On Thu, 28 Jan 2016 07:26:27 -0500, Marc Leclerc wrote:

> First thanks to Thomas for pointing out that user question were welcome on
> this list, I wasn't sure either, and thanks to the team who maintain
> buildroot.

You're welcome, and indeed user questions are welcome. Your question is
in fact only tangentially related to Buildroot, and is more a generic
embedded Linux question, though I believe some of us can give some
insights.

> I have been using buildroot for a while now and it really made my life
> easier. Today I would need it to go one step further and provide a working X
> frontend that would work on a 7" touch screen and I have basically zero
> experience on making that happen. The need here is to run a local gui to our
> device. I gave it a few try and got some xterm going but am missing the rest
> of the road. I have also found a few how-to but they are outdated and often
> about deprecated packages.

So, if you've got a xterm working, it means that the X.org server is
running and everything is fine.

> So hopefully someone on this mailing list may have some insight to share or
> a link I missed. I had hope that ldxe would be part of buildroot but any
> frontend that is stable and will run gtk2 apps would do (in my case I'm
> giving lazarus a try since I already have some Delphi code that works for
> the gui). To top with a cherry, calibration for the screen and a virtual
> keyboard would be nice :)

If all you want to do is to run a single application fullscreen, then
there no need for a "desktop" like LXDE: you can simply run your own
application. It isn't clear from your question whether your application
is already written or not, and if it's already written, with which
toolkit. You're mentioning gtk2, but it's not clear if you give it as
an example, or a hard requirement.

Essentially, to write GUI applications, you have a few choices:

 * Develop your application in Qt. In this case, no need for X.org, you
   can run your application directly on top of the framebuffer, with no
   X server running. Since you're using an i.MX6 SoC, you have OpenGL
   acceleration available (Buildroot has all the packages for this). So
   just build Qt5 with the eglfs back-end, and start your application
   from a shell, and off you go.

 * Develop your application in Gtk (preferably Gtk3 rather than Gtk2
   which you mentioned). In this case, the only usable backend today is
   the X.org backend. So enable Gtk3 in the Buildroot configuration,
   and then from the shell (over the serial port), you can 1/ start the
   X.org server, 2/ export DISPLAY=:0 and 3/ start your application. Of
   course, all of this can be automated via init script, or even
   better, a X startup script.

   You can start by enabling BR2_PACKAGE_LIBGTK3_DEMO, which will give
   you a demo program written in Gtk3.

 * Develop your application with the Enlightenment Foundation Libraries
   (EFL). They are less popular/known/documented than Gtk/Qt, but they
   work well on embedded systems. They can work on top of the
   framebuffer directly (i.e no need for X), or together with X.org.

There are of course plenty plenty more of additional options, but those
are probably the most obvious/popular ones.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
