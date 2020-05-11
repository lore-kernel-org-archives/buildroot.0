From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 May 2020 22:26:50 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix input_event related
 compile failure
In-Reply-To: <87wo5jplh4.fsf@dell.be.48ers.dk>
References: <20200504214552.26570-1-ps.report@gmx.net>
 <871rnrr05p.fsf@dell.be.48ers.dk> <87wo5jplh4.fsf@dell.be.48ers.dk>
Message-ID: <20200511222650.01b25eaf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 10 May 2020 22:45:59 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:  
> 
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
>  >> Fixes:
>  >> - http://autobuild.buildroot.net/results/af76190876656252eb6f60220cdb1d627a03b7c3  
> 
>  >> evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ?void QEvdevKeyboardHandler::switchLed(int, bool)?:
>  >> evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>  >> ::gettimeofday(&led_ie.time, 0);
>  >> ^~~~
>  >> type  
> 
>  >> evdevtouch/qevdevtouchhandler.cpp: In member function ?void QEvdevTouchScreenData::processInputEvent(input_event*)?:
>  >> evdevtouch/qevdevtouchhandler.cpp:579:29: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>  >> m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
>  >> ^~~~
>  >> type
>  >> evdevtouch/qevdevtouchhandler.cpp:579:49: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>  >> m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
>  >> ^~~~
>  >> type  
> 
>  > A similar fix is presumably also needed for 2020.02.x? Care to send a
>  > patch?  
> 
> Or perhaps not? This only triggers with musl 1.2.0+ on 32bit OS'es
> (which we don't have in 2020.02.x), right?
> 

Yes, I believe your analysis is right, the musl 'package/musl: bump to version
1.2.0' commit ([1]) - only available on master - is stating:

  This release moves all 32-bit archs to 64-bit time_t, enabling them
  to represent times beyond January of 2038.

  There are no new requirements on kernel version, and this is not a
  hard ABI break, but the type changes do impact compatibility between
  code built against previous versions of musl and code built against
  musl 1.2. Users upgrading 32-bit systems should read the detailed
  time64 release notes [2]. 64-bit systems are not affected.

Which is exactly the failure cause (and autobuild configuration)...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=c3012c3cc28a6686bb47f2489a218b90e557f0b8
