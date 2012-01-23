From: Karl Krach <mailinglists@bluespirit.la>
Date: Mon, 23 Jan 2012 11:15:03 +0100
Subject: [Buildroot] Qt command line issue
In-Reply-To: <201201210353.59935.arnout@mind.be>
References: <2cff0fc240e25617ac5c8ae586f9c698@bluespirit.la>
 <201201210353.59935.arnout@mind.be>
Message-ID: <1859e5c4b20c16813d71ab9e71fdd3e0@bluespirit.la>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Jan 2012 03:53:59 +0100, Arnout Vandecappelle wrote:
> Are you sure you get this over SSH?  This is typically what you see 
> on a
> serial terminal.  The serial terminal should be configured to expect 
> LF
> instead of CRLF.  Alternatively, if you have a shell on the other 
> side,
> you can do 'stty onlret' (or is it -onlret?) to let the tty driver 
> insert
> the CR.

You ve been right. I was just so naive to type "stty onlret" before 
starting my application. This is how it works:

     // Save terminal settings
     int m_tty_fd = 0;
     struct ::termios termdata;
     tcgetattr(m_tty_fd, &termdata);

     QApplication app( argc, argv, QApplication::GuiServer );

     // Restore terminal settings
     tcsetattr(m_tty_fd, TCSANOW, &termdata);


There is a line in the Qt sources (which I found after Frank gave me 
the tip, that the problem only appears when setting the QWS_KEYBOARD 
environment variable) which removes the "onlret flag" when isatty(0) 
returns true. Issue #1 is also solved with this lines - but I don't know 
why :)

Best regards,

Charly
