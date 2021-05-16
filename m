From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 14:13:55 +0200
Subject: [Buildroot] [PATCH v2 5/7] support/scripts/gen-missing-cpe: add
 new script
In-Reply-To: <159f1b0c-07cd-e6b4-dc7f-1cbea516efb7@mind.be>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-6-thomas.petazzoni@bootlin.com>
 <159f1b0c-07cd-e6b4-dc7f-1cbea516efb7@mind.be>
Message-ID: <20210516121355.GD2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-02-02 22:29 +0100, Arnout Vandecappelle spake thusly:
> On 31/01/2021 14:38, Thomas Petazzoni wrote:
> > From: Matt Weber <matthew.weber@rockwellcollins.com>
> > 
> > This script queries the list of CPE IDs for the packages of the
> > current configuration (based on the "make show-info" output), and:
> > 
> >  - for CPE IDs that do not have any matching entry in the CPE
> >    database, it emits a warning
>  Maybe there should also be a warning for packages which don't have cpeid set at
> all...

I haven't done anything to do so; I though it was better to have at
least this script in its current state, rather than nothing at all.

[--SNIP--]
> > +def gen_update_xml_reports(cpes, cpedb, output):
>  cpes should be cpeids (I first thought it was a list of CPE objects from cpedb).

Done.

[--SNIP--]
> > +        fp = open(os.path.join(output, fname), 'w+')
> > +        fp.write(xml)
> > +        fp.close()
>  This should be
>         with open(...) as fp:
>             fp.write(xml)

Done.

[--SNIP--]
> > +def resolvepath(path):
> > +    return os.path.abspath(os.path.expanduser(path))
> 
>  I don't understand this...
> 
> - expanduser should already have been done by the shell. If you call the script as
> 
> gen-missing-cpe --output \~/some-path
> 
> then I want the output to be in a directory called ~ in the current directory.
> That's what the rest of the world does. (Yes, I get it, you want to be able to
> do --output=~/some-path but that's just wrong.)
> 
> - abspath shouldn't be needed for anything, we're not doing any changedir or
> anything like that.
> 
> In addition, this script is supposed to be called from `make missing-cpe` which
> has already done those expansions.

It was not obvious to me either that resolvepath() was needed, and as]
you said, the usage we have in Buildroot does not need expansion.
However, getting rid of it seemed too much, so I left it as-is.

Again, I thought it was better that we have this script rather than
nothing.

[--SNIP--]
> > +__main__()
> Usually it would be
> if __name__ == '__main__':
>     __main__()

Done.

>  Nothing important here, but I want to give you the chance to rework if you
> think it's worth it, so just
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This was sitting in the backlog for quite a while, and we really needed
to push a bit on our CPE (and CVE) tooling, so I applied this to master
now.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
