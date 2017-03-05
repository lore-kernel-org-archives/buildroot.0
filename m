From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 15:44:59 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <00b34c21-2baa-6f93-9032-e3946481af68@lucaceresoli.net>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <00b34c21-2baa-6f93-9032-e3946481af68@lucaceresoli.net>
Message-ID: <20170305154459.70580ff4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

Thanks a lot for your review!

On Sun, 5 Mar 2017 00:26:56 +0100, Luca Ceresoli wrote:

> The only thing I don't like very much is the output format. It's very
> unpleasant and I'd like it to be nicer. But since we are using a testing
> framework I guess this is non trivial. In this case I'll gladly accept
> what we have: runtime testing with unpleasant output is _a lot_ better
> that no runtime testing.

Agreed.

> > +ARTEFACTS_URL = "http://autobuild.buildroot.net/artefacts/"  
> 
> I think the usual spelling is "artifacts".

artifact is US, artefact is UK apparently. So I've changed to artifact,
like you suggested :)

> > + at contextlib.contextmanager
> > +def smart_open(filename=None):
> > +    if filename and filename != '-':
> > +        fhandle = open(filename, 'a+')
> > +    else:
> > +        fhandle = sys.stdout
> > +
> > +    try:
> > +        yield fhandle
> > +    finally:
> > +        if fhandle is not sys.stdout:
> > +            fhandle.close()  
> 
> contextmanager and yield took me some time and research to understand
> what this function is. For non-pythonists, I'd add a comment such as:
> 
> """
> Return a file-like object that can be written to using the 'with'
> keyword, as in the example:
>   with infra.smart_open("test.log") as outfile:
>     outfile.write("Hello, world!\n")
> """

Added. But to be honest, I dislike this Pythonic construct. Originally,
I was opening the log file at the beginning of the test, keeping the
file handle in an object member, and simply writing to it (exactly like
you suggest below).

But then Maxime did a pass on my code to make it more Pythonic, and
replaced it with this construct. To me, this is a lot more horrible
than it was:

 - It's not understandable by non-Python experts

 - Each write to the log takes two lines instead of just one previously

 - It opens and closes the log file each time you want to write a
   single line to it

So overall, I'm not at all impressed by this, and seeing that you are
also not impressed makes me considering reverting to my previous
solution.

> Also, since it creates a writable thing (not a readable one), a name
> like open_for_writing() would be more understandable.

Makes the name a bit too long IMO, and I'm not sure it's really worth
the effort.

> > +    try:
> > +        url_fh = urlopen(os.path.join(ARTEFACTS_URL, filename))
> > +        with open(tmpfile, "w+") as tmpfile_fh:
> > +            tmpfile_fh.write(url_fh.read())  
> 
> I think this code read()s the whole file in RAM, then writes it all out.
> This might be a problem if we download large files. Is there any
> pythonic way to read-and-write in chunks without much added code? Come
> on pythonists, I'm sure you can do it with at most one extra line... :)

urllib.retrieve() automatically does the download, but apparently,
there's no feedback on whether it was successful or not.

Anyway, I'll leave this for the future, the current code works fine,
and it can be improved by Pythonists later.

> A small example as documentation would help. Draft proposal:
> 
> """
> Runs the cross readelf on 'fpath', then extracts the value of tag 'tag'.
> Example:
>   >>> get_elf_arch_tag('output', 'arm-none-linux-gnueabi-',  
>                        'bin/busybox', 'Tag_CPU_arch')
>   v5TEJ
>   >>>  
> """

Added.

> > +        log = "{}-build.log".format(self.builddir)
> > +        if self.logtofile is None:
> > +            log = None  
> 
> I think there's a bug here. The 'logtofile' variable in BRTest is always
> assigned to True or False, then passed to Builder. So self.logfile here
> is never None, and this if never matches.

Agreed, fixed.

> > +
> > +        config_file = os.path.join(self.builddir, ".config")
> > +        with open(config_file, "w+") as cfd:
> > +            cfd.write(self.config)  
> 
> I wonder what the 'd' in "cfd" means...

Don't remember. Maybe "descriptor". But I've changed that to just "cf"
anyway.

> > +        cmd = ["make",
> > +               "-C", os.getcwd(),
> > +               "O={}".format(self.builddir),
> > +               "olddefconfig"]  
> 
> Why do we need to add "-C" + os.getcwd()? I think this is equivalent to
> "-C ." in shell, which is the default make behaviour.

Don't remember why this was added, I've dropped it now.

> When first reading this, I understood that the 'builtin' kernels are
> provided by qemu. Instead, they are provided by some server that is
> related to the Buildroot project (currently free-electrons.com).
> 
> So I'd rephrase as:
> 
>     # kernel: path to the kernel image, or the special string
>     # 'builtin'.
>     # 'builtin' means a pre-built kernel image will be
>     # downloaded from <BASEURL> and suitable options are automatically
>     # passed to qemu and added to the kernel cmdline. So far only armv5
>     # and armv7 builtin kernels are available.
>     # If None, then no kernel is used, and we assume a bootable device
>     # will be specified.

Fixed. Probably all comments should be moved to Python docstrings at
some point.

> > +        if options:
> > +            qemu_cmd += options  
> 
> If the default value for 'options' were '[]', the if would not be
> needed. Not it is because 'None' is not iterable.
> 
> > +
> > +        if kernel_cmdline is None:
> > +            kernel_cmdline = []  
> 
> If the default value for 'kernel_cmdline' were '[]', these two lines
> could be removed entrely.

To be honest, for the kernel_cmdline, it took me a while to get the
proper construct that ends up with the quotes at the right place. So
I'd prefer to keep it as-is for now, and if you want to clean that up
later, while making sure it still works at runtime, be my guest :)

> > +        with infra.smart_open(self.log_file) as lfh:
> > +            lfh.write("> log in\n")  
> 
> smart_open() is called 3 times in login(), 2 in run() and a few more
> timer elsewhere in this class. Can't we open the file once in the
> constructor and the just write to it?

See above: I also *hate* this smart_open() thing. It is not smart at
all. It is stupid like crazy.

> > +    # Run the given 'cmd' on the target
> > +    # return a tuple (output, exit_code)
> > +    def run(self, cmd):
> > +        with infra.smart_open(self.log_file) as lfh:
> > +            lfh.write("> running '{}'\n".format(cmd))
> > +
> > +        self.__write("{}\n".format(cmd))  
> 
> I think this simpler form is equally legal:
> 
>   self.__write(cmd + "\n")

Fixed.

> > +    def showlog(self):
> > +        print "=== Full log ==="
> > +        print self.log
> > +        print "================"  
> 
> Unused function.

Indeed, removed.

> > +def main():
> > +    parser = argparse.ArgumentParser(description='Run Buildroot tests')  
> [...]
> > +    if args.download is None:
> > +        print "Missing download directory, please use -d/--download"
> > +        return 1  
> 
> It would be nice to use an environment variable as a default for the
> download dir. It might be BR2_DL_DIR itself, i.e. sharing the existing
> Buildroot package download dir. I bet most people set BR2_DL_DIR in
> their ~/.bashrc.

Good point, added.

> > +    if not os.path.exists(args.output):
> > +        print "The selected output directory does not exist"
> > +        return 1  
> 
> If the download directory does not exist is is created. Why is the
> output directory handled differently?

Fixed.

> And again, it would be nice to default to an environment variable, e.g.
> BR2_RUNTIME_TESTS_OUTPUT_DIR.

Not sure about this one, I don't really like environment variables in
general. I've kept it as an option only for the moment, we can revisit
this later.

> > +    BRTest.outputdir = args.output
> > +
> > +    if args.all is False and len(args.testname) == 0:
> > +        print "No test selected"
> > +        return 1  
> 
> I like programs that print their usage whenever the command line has
> errors (in addition to telling what the error is).
> 
> IOW (untested):
> 
>     if args.all is False and len(args.testname) == 0:
>         print "No test selected"
> +       print ""
> +       parser.print_help()
>         return 1

Agreed, fixed!

Thanks again for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
