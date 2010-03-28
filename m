From: Sergey Naumov <sknaumov@gmail.com>
Date: Sun, 28 Mar 2010 15:56:58 +0400
Subject: [Buildroot] uclibc and key parsing
Message-ID: <7627a87b1003280456hb6b359csa93bc9fd52b1adde@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.

I am a newbie to the uClibc library.
I have made my own function to get escape sequences from keyboard using
glibc, particularly libio.h:

int KBD_get_sequence(unsigned char * _buf)
{
    int result;
    _IO_FILE * _fp = _IO_stdin;

    if (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0))
    {
        result = __uflow (_fp);
        _buf[0] = (unsigned char) result;
    }
    else
    {
        _buf[0] = *(unsigned char *) (_fp)->_IO_read_ptr++;
        result = (int)_buf[0];
    }

    if ((_fp)->_IO_read_ptr < (_fp)->_IO_read_end && result == '\033')
    {
        int _i = 1;
        while(_IO_BE ((_fp)->_IO_read_ptr < (_fp)->_IO_read_end, 0))
        {
            _buf[_i] = *(unsigned char *) (_fp)->_IO_read_ptr++;
            ++_i;
        }
        _buf[_i] = '\0';
    }
    return result;
}

This function writes the whole ESC sequence to the buffer _buf.
But in the uClibc there is no libio.h file. As I discovered, there is
read_key function in busybox, but this function is quite complex and uses
knowledge about ESC sequences which we expect to get. Is there a way to add
similar libio.h file to uClibc headers or get the same functionality in
another way?

Thanks in advance.

Sergey Naumov, Saint-Petersburg, Russia.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100328/e38ffcec/attachment.htm>
